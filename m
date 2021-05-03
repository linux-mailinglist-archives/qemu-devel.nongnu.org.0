Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5DF3715DF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:21:06 +0200 (CEST)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYVU-00087h-1d
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYPX-0004D6-PP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:14:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldYPV-0000Zl-Bo
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:14:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id a4so5517155wrr.2
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TRgVWifi3v+tnEZLiMv7T0kAjGtSRMSwvFxIKMVlYqM=;
 b=YvGDL2v6a6PbS/qbzZdx6LZJaOhLOchxvmxDFDxcRG4b1G2s+OFSJ+kkeb+2l/zS9d
 11NqDCyvgXOqFuaUkZfAiAiGdUCvZogUzyeXJ5Uf2d6FA2nJyPzoM/YHL7P6UakfGYuv
 kQWGjxFxoRTx6yWlz23JmrEHOYAgsl4JDxl2m0sDDVcApWfV+Z7xw8yHOYe/4mFwWvGU
 pQukAC9RWG9lyUKJ0XPsw8JkEBHcOfRLXgxI79hzLeecQXexDP18edKuxeyPvDAZWptC
 9eFFIjis2MdMN5dSt5+qqg6Q6073viDBLSzP1lEtQ5En72lQ7REQkyvu3H9YpUCdlxoe
 8gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TRgVWifi3v+tnEZLiMv7T0kAjGtSRMSwvFxIKMVlYqM=;
 b=j9lA/csffNlboMIsPqvScT9trcnGbFYJVG6ast0UtaqYt0D3ul7qvUhzCEaFrSssLE
 QjCmvDtEPpi40YWGdm2+CUIRUR3c0EXo9VVrJGq9GwD2QqNycy+5pYxQwj6IK1Fhe5hI
 +xDHwqz+kstrXch5Qh3eVTkDxiMxnHORPxLS/vTFkzYUSoHzOy1HD7GDg9AAaJfGXIM8
 kj/QPkSAiB43JLJr1GRyqaUysZPcCM5mX20ellBRSuhR3d3X8BVDjckJ+sEjz9UKxXgJ
 Z0Gg7ku8EkaSSoupruseV5GjcFAgMDLwAWbjcptEaIgcxyFwlKRkPV6Jv7jsdocGez+S
 zUTw==
X-Gm-Message-State: AOAM5311Y93XTc/10ra6Fv6uF0MoR9LGAXUHTjltkhB+xpdx6UnfWslz
 9/fQZR+vCs6aCHCpQ+oSQFA=
X-Google-Smtp-Source: ABdhPJyGEojQCtVi7LoN8Q8mnW9qm4MROtSmuxLMvS795U5fHOmXwwL0Djbn6nWbfBICb3D16BKf0A==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr18645934wrz.256.1620047691642; 
 Mon, 03 May 2021 06:14:51 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y14sm11981201wrs.64.2021.05.03.06.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:14:51 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2b965963-1bbc-2755-60dc-8f7521939058@amsat.org>
Date: Mon, 3 May 2021 15:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 11:59 AM, Markus Armbruster wrote:
> If you're cc'ed, you added a section to docs/system/deprecated.rst that
> is old enough to permit removal.  This is *not* a demand to remove, it's
> a polite request to consider whether the time for removal has come.
> Extra points for telling us in a reply.  "We should remove, but I can't
> do it myself right now" is a valid answer.  Let's review the file:

>     Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
>     The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
>     to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
>     machines have been renamed ``raspi2b`` and ``raspi3b``.

Done:
https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg00492.html

>     nanoMIPS ISA
>     ''''''''''''
> 
>     The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>     As it is hard to generate binaries for it, declare it deprecated.

MediaTek said they want to contribute and are in the process of
upstreaming nanoMIPS toolchains, so we'll keep it in this state
until the next release.

Thanks for the reminders,

Phil.

