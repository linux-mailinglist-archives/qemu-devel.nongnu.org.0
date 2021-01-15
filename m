Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C72F8335
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:01:37 +0100 (CET)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TPk-0003Tj-Tn
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0TM7-0001Ut-2H
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:57:51 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0TM5-0006tw-Hy
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:57:50 -0500
Received: by mail-ej1-x62a.google.com with SMTP id l9so8803532ejx.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 09:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w88qG2GeO1zcTpOQb993/FZtU4CfiN9JxrsmIQo8vag=;
 b=KzcGgzd+YJqqQS9m2nglsbEDjQBusl3hfXeyKgf5/b9H5e7JIacnmgWTPACMt2xuKW
 2qigAa0A6AxDyJdWW0sMgKd95qtGp543Qyq02fAykoAt+EEgReuOFwGKPv27LeKta9NZ
 Nyx+kNb6frfuqadN49TiJdPcdXUFNTK4GnhPcR8MXlhK9A77b5rLOPGtGo0hE7FlAqr+
 v5BhBJ6bmRs3ZFCIzYGIFE2NdWP8eGx/jvcXNru8jkBZva0DBb5/dXCYh4DyjM+A9Pvz
 GT3+z4xMM0CZw9y7Qf0+2fr0yLxEozb6EkKjCOo3U4yHGbW9JB32mI/F72kb/EGrfCNB
 tEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w88qG2GeO1zcTpOQb993/FZtU4CfiN9JxrsmIQo8vag=;
 b=beiLuGR8RXV4Yc1nD1fXM27kj0sv/z32S1pe3+Q45kZzkD0o3mulcKe5bfFqiX8U67
 jZEGPCShUXp9MrH0XM5zFGE7zD27qkhHf119GrNF2ADfdD+udSKtygS9GXj/oiokVYg6
 BE9i2G9El1iSWGsKrRh1ANPdmyEoVtu5v4bZAwK9dLE9CnsSiayJbL8Nkovy8mlugrlI
 fgTsu55D0VjCLGik2JedAuolG6upzPFR6d6B25vB2Sojc5K5UKe4NR/AQxnZ3QCrEupg
 8qxI09csilapnM6Y/u8w0c9JfjjjonXn6VMcO8nUaLCv2Ue6/SnMungkMKL7Ok41plq7
 Pgbg==
X-Gm-Message-State: AOAM531VR8GuTLk7kGTiG9ITSdb88QqxuzX4b7Hsuun+fCXGmB+iQkNx
 QNQEDAIuN2va5R5qKs6ykpQ=
X-Google-Smtp-Source: ABdhPJwG5Y4SRx3G709UsXGhKlIpy9X/pKc8ogVl8jENFkBLkvbKzdrDKGB450X3L7r01dP1be24EQ==
X-Received: by 2002:a17:906:36da:: with SMTP id
 b26mr9477957ejc.28.1610733466390; 
 Fri, 15 Jan 2021 09:57:46 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id ko23sm3736856ejc.35.2021.01.15.09.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 09:57:45 -0800 (PST)
Subject: Re: Windows installer builds apparently broken since October?
To: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
 <980269ad-bd28-08e5-0be0-fb5564aa7cd5@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d229c822-5d64-8aae-853f-ef88878341ca@amsat.org>
Date: Fri, 15 Jan 2021 18:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <980269ad-bd28-08e5-0be0-fb5564aa7cd5@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 4:34 PM, Stefan Weil wrote:
> Am 15.01.21 um 15:01 schrieb Peter Maydell:
> 
>> I was just trying to see what updates the qemu.nsi file needed for
>> the merge-all-the-manuals-into-one-place change, and I discovered
>> that it's been broken since October when we removed the Changelog file:
>>
>> File: "/tmp/qemu-test/src\Changelog" -> no files found.
>> Usage: File [/nonfatal] [/a] ([/r] [/x filespec [...]] filespec [...] |
>>     /oname=outfile one_file_only)
>> Error in script "../src/qemu.nsi" on line 119 -- aborting creation
>> process
>>
>> You can reproduce that with:
>>
>> make -C my-build-dir docker-image-fedora V=1 NETWORK=1
>> make -C my-build-dir docker-test-mingw@fedora J=8 NETWORK=1
>>
>> This used to be in CI (patchew ran this config) but it clearly can't
>> be being CI'd any more, or we'd have noticed.
>>
>> Stefan, I see you have more recent installer binaries on your
>> site than that -- do you have some local patches for this?
> 
> 
> Hello Peter,
> 
> although I have some local fixes (available for example in
> https://github.com/stweil/qemu/) I am still struggling with 5.2.0.
> 
> One problem which was recently discussed on the list is the directory
> structure of the installation (especially the location for BIOS and
> similar files) which still needs changes (which als require updates for
> qemu.nsi). I'd prefer a similar hierarchical structure for both Linux
> and Windows (instead of a flat one which does not work with the current
> code).
> 
> Other problems are caused by the new QEMU build system in my special
> build context (Debian cross build with Cygwin packages).
> 
> A third challenge comes from users who would like to see new features
> like zstd or braille which up to now were missing in my binaries.
> 
> As I am quite busy with other things, too, I am afraid that it will take
> some more weeks until I can send a set of patches to fix the most urgent
> issues.

Cc'ing Yonggang Luo who might help.

> 
> Removing Changelog from qemu.nsi is easy, but not nearly sufficient:
> https://github.com/stweil/qemu/commit/923c93a663e4e51231f6ea389c19c0a960fa9f99.
> 
> 
> Kind regards,
> 
> Stefan
> 
> 
> 


