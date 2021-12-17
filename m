Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2498478702
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:25:33 +0100 (CET)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9Ua-0007xI-SQ
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:25:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my9Rf-0006A1-3O; Fri, 17 Dec 2021 04:22:31 -0500
Received: from [2a00:1450:4864:20::32e] (port=33756
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my9Rd-0004Hd-Dy; Fri, 17 Dec 2021 04:22:30 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso2475337wmi.0; 
 Fri, 17 Dec 2021 01:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xqNxNOmq6c+GpzZXeEbCPBx/ceBEwYq055rdIyKiROg=;
 b=DNx9WClQAWpiPpgDaQyprNA5O/24ujb39XVeGPVji9OrOTnNsSNUYt8e9vO0wzZcPD
 msPqnoaAifkqMFYmFTNiW8mKbWeqaL1GHvYzZox1zj6SDJtn7TCqPJguG6J1I/4yyls+
 ka9vw6mD0B+l2qBktnOCxgVJCqGucwoqOUjRT+U06opImWxkMZqvX8ITVsbu56H7wjPa
 u1G9haOfAFs1djea9UxrY7e1GZz0urq7CJrY52f13965xrMU49OIhgVixj8WdgoEOQgM
 9hb2p94Nzbu2nLFEa+EbMNnMtj70whw4dCsqE9n+929NRVfeQamrDDqMkSXEUmYBtaE2
 YNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xqNxNOmq6c+GpzZXeEbCPBx/ceBEwYq055rdIyKiROg=;
 b=jFGmmvDEUHeO1lh4/QCoITTjAhCJ2TwSfY4C2Wo2sV3G7+FdbCsBICL2Ym1x27Z4i3
 2dC8gCIJsKPqoNAcbBpnS7GP0wQSf+siz6LhHUk/X8GexId7hoUOcb7n7FPpQQroMujo
 rOZ3kZzNv3SGnEQuwlj0x1wrq/DSNGOTFZE0bwb93WtZG6oQlNLKCLDbuy0o13ydEi16
 dhx6/cnyjjWLNPwbIJ+o3gmfUYslNY0xfg6dUSDpZdYVjN3ujAa4jsfpn6dmBWLWQDzr
 gbRVya3DhmwFZHy/fTz7odxFOkI2mCjH9RvhUYck0ysTaZadjyai9f+RokTuRCOR+Cqo
 YP4w==
X-Gm-Message-State: AOAM531cMRep1YcdvEk2GWvFThiS04ZnVdO477NRJfnPWtlmQ2bb04aF
 XzKklZ1mr7uQ+WKBWpZ5GRI=
X-Google-Smtp-Source: ABdhPJxQaqDyz03egwjikB9XLMVKosXuuKy/rrEhY9CD8spbj/wlUg6qGwwPdTzvXqSzekDyRWOPzg==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr8765522wma.42.1639732947540;
 Fri, 17 Dec 2021 01:22:27 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id q206sm2964820wme.8.2021.12.17.01.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 01:22:27 -0800 (PST)
Message-ID: <f9e88e42-aac3-ab0c-6bdc-354c2cebfba8@redhat.com>
Date: Fri, 17 Dec 2021 10:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 0/2] hw/scsi/megasas: Avoid overflowing the SGL
 buffer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211119201141.532377-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211119201141.532377-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hannes Reinecke <hare@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 21:11, Philippe Mathieu-Daudé wrote:
> Fix issue #521 reported by Alex some months ago:
> https://gitlab.com/qemu-project/qemu/-/issues/521
> 
> Philippe Mathieu-Daudé (2):
>    hw/scsi/megasas: Fails command if SGL buffer overflows
>    tests/qtest/fuzz-megasas-test: Add test for GitLab issue #521
> 
>   hw/scsi/megasas.c               |  1 +
>   tests/qtest/fuzz-megasas-test.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 

Queued, thanks.

Paolo

