Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A694938BA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:47 +0100 (CET)
Received: from localhost ([::1]:48766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8RN-0005VK-RA
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8JL-0007M8-2a; Wed, 19 Jan 2022 05:35:27 -0500
Received: from [2a00:1450:4864:20::32f] (port=55282
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8JG-0006B5-MC; Wed, 19 Jan 2022 05:35:25 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p18so4407973wmg.4;
 Wed, 19 Jan 2022 02:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lo2Jpv3r3XyMxqcFmgVs89/MCpaFhRpAcMBoSt3IbCs=;
 b=b/g1yHFAAD5H4FVa9FNp5yhnISqSup5HvjFPFPaMdZRHTs/7MJ3Et/XCHqTJsyC2si
 ARw/KFN2kGM4wXagzLK4HdPPSAtJWfbqRGEoqXMb2tkEtZxOEhUbPyzmS0gvf55cZvpg
 QWt8p2W1rijdhslIbxuTElpO30Mtt0U2U+Fr/+bFRO+qGuGsU3dxTS+zt4Pd0uvEY50j
 yId7rplwN5+AeV+JvevU2mK6N9jj4qNvlbXpZ3sNx22sFP30woa98oMaG9XJkGKyNT/t
 fVXUb6SbpmnpJoRcOGJ9WLyFMnhHqa0ZgGE1duYmbMA26t6Ee8Rc35Xn94/PZov4aLu7
 6vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lo2Jpv3r3XyMxqcFmgVs89/MCpaFhRpAcMBoSt3IbCs=;
 b=KBHnuSVvt1cLQheHAFn0kl9KaTNJHGfcfMgyykaATOM/YmIipVgOq8ziHrg/9Q1tuH
 g0v328NLjD1qbeiXq3x19QAHC3dXyt8jbsLKuNlJA/i3QDJWYEkYP09sD9fo6zACXmk3
 8iYwDEl8cc8l1jf12d/BAe7965+/Cuq3syNeskQmFKTcRNqzpb4hPG4LCGG94NkBT4oQ
 fR/Ud/W7ZAF8itEOwqkvHMOIwzpUMixCm7tAuWyohew9ePwklFtcyLn7eYtA/ovaDvbk
 9gey7WCJaZEFnymV15bORsp14ubL0RRPIt/LdeWsDA6E6LEwDfFJ76HKSc9K0fgR15WZ
 sPKQ==
X-Gm-Message-State: AOAM5320rSU+bCOkIKth/y0luSDDh2POAz89ZbHqsCFpelZE72Yc9gw4
 xgIak/Czi3CavRMHIdThuwY=
X-Google-Smtp-Source: ABdhPJysdo7fgaG96mRttNyQkxADI28642iA0kAsaarqeDgo0bPIsOBnqLBPIGxg6wR6Sg4FfMBgAQ==
X-Received: by 2002:adf:e312:: with SMTP id b18mr22704207wrj.321.1642588505160; 
 Wed, 19 Jan 2022 02:35:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b6sm15537050wri.108.2022.01.19.02.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:35:04 -0800 (PST)
Message-ID: <bdc7eaac-82b4-3fb0-be72-d03afca0ac41@redhat.com>
Date: Wed, 19 Jan 2022 11:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 15/16] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-16-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-16-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 15:02, Emanuele Giuseppe Esposito wrote:
> 
> Now that they are not nop anymore, remove the aiocontext
> to avoid deadlocks.

Ok, that should have been in patch 1, together with a description of the 
deadlocks. :)  Disregard that review.

> There is only one JobDriver callback, ->free() that assumes that
> the aiocontext lock is held (because it calls bdrv_unref), so for
> now keep that under aiocontext lock.

This explains the issue with detach_child in the other series, too.

Paolo

