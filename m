Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1894A5B3B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:33:04 +0100 (CET)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErPA-00042r-9e
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:33:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEr7C-0004cn-82; Tue, 01 Feb 2022 06:14:27 -0500
Received: from [2a00:1450:4864:20::42a] (port=43631
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEr79-0003TM-Or; Tue, 01 Feb 2022 06:14:25 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v13so31206876wrv.10;
 Tue, 01 Feb 2022 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Pqau15STyQj1RTIybvhWcMbvmLWawJh363OkkOBi6c=;
 b=YkElsx1cur/W1Q6OJ4gNbXOt5Fh7XoWEOmxVLmqiqQCBMBlVsAlht+eX/Nu6e52QBv
 n/JXgORIFxpv91lncDpWyIgIUw8wUjsT+M2zhbLzMLWgQ3brvnzpeSGUQ95YvLbRZe1U
 NwIzm+Gqht79rLD8K/ptYj1sRkBXWeNi53Y2sjtD2vMKyaMj9ou7J+k64yzjusFc0O2u
 DKWMu936U9jfMVilgg9gnaVfj4htxJJbuMLNikiO3ef1yO7FQOAtkEVjfsDTbigCSld6
 2fibdxNZqtpIs2xWcV4BYevIqs0snwhuQmLFjGa6HMYFz51EfvqtpnRJP3JR8LFdw+1g
 3K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Pqau15STyQj1RTIybvhWcMbvmLWawJh363OkkOBi6c=;
 b=jkrLsRimwgIWnEYNCPLGnYLybSRtp7pMPYbCubSoyDO3R0mSAlqX05LCbm1fk+X7He
 if/vBfjlRjENDFhvrDH7sGp6RSEy3Bf91U3MUCwTEttU5i85l51xhbqPh3OcVrRoz8yO
 QVQ9ArqsTIMXn6NGXaJCA3cVCZ5AV/H+1m02M8JgvMuiNdcqk7nSdaT0wgdAUyVhND8h
 bVsAcu9qWoR7CmH8e6CBQFiJEs/6uptXB1Z21gm9SFmFHjxk7gxFfE5eQo5CAZAkTpif
 SnEcDF1p6v8XgbqxZIa9aeNFnpcoMTFHOM2NnmrktLck+3ThlWiW6RSMSIBe5+EYbTUW
 mstA==
X-Gm-Message-State: AOAM533laGCQbXCowmcAYLjQ2RSDfFDBubkEQojOaSAr6nW/tx9xmruI
 LMAt2fg4FsH2HE5Z/R9hzfA=
X-Google-Smtp-Source: ABdhPJxVRdVD9nkaPd5iD0fY2hn3XULnrFlTLHvOiazUHltVA8celrtuqL46VosuRiUcKEQFhx60DQ==
X-Received: by 2002:a5d:4112:: with SMTP id l18mr12288860wrp.37.1643714055693; 
 Tue, 01 Feb 2022 03:14:15 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u14sm14165219wrm.58.2022.02.01.03.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:14:15 -0800 (PST)
Message-ID: <1bb88666-4f4f-b7c2-def2-7460ac1764fd@amsat.org>
Date: Tue, 1 Feb 2022 12:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] block/export/fuse: Fix build failure on FreeBSD
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-block@nongnu.org,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>
References: <20220122134940.401590-1-f4bug@amsat.org>
 <YfLFLzOsqlzJUvNq@redhat.com>
In-Reply-To: <YfLFLzOsqlzJUvNq@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/27/22 17:15, Kevin Wolf wrote:
> Am 22.01.2022 um 14:49 hat Philippe Mathieu-Daudé geschrieben:
>> When building on FreeBSD we get:
>>
>>   [816/6851] Compiling C object libblockdev.fa.p/block_export_fuse.c.o
>>   ../block/export/fuse.c:628:16: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
>>       if (mode & FALLOC_FL_KEEP_SIZE) {
>>                  ^
>>   ../block/export/fuse.c:632:16: error: use of undeclared identifier 'FALLOC_FL_PUNCH_HOLE'
>>       if (mode & FALLOC_FL_PUNCH_HOLE) {
>>                  ^
>>   ../block/export/fuse.c:633:22: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
>>           if (!(mode & FALLOC_FL_KEEP_SIZE)) {
>>                        ^
>>   3 errors generated.
>>   FAILED: libblockdev.fa.p/block_export_fuse.c.o
>>
>> Meson indeed reported FALLOC_FL_PUNCH_HOLE is not available:
>>
>>   C compiler for the host machine: cc (clang 10.0.1 "FreeBSD clang version 10.0.1")
>>   Checking for function "fallocate" : NO
>>   Checking for function "posix_fallocate" : YES
>>   Header <linux/falloc.h> has symbol "FALLOC_FL_PUNCH_HOLE" : NO
>>   Header <linux/falloc.h> has symbol "FALLOC_FL_ZERO_RANGE" : NO
>>   ...
>>
>> Similarly to commit 304332039 ("block/export/fuse.c: fix musl build"),
>> guard the code requiring FALLOC_FL_KEEP_SIZE / FALLOC_FL_PUNCH_HOLE
>> definitions under CONFIG_FALLOCATE_PUNCH_HOLE #ifdef'ry.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Fragile #ifdef'ry... Any clever idea?
> 
> I guess we could reorder things. The last case (!mode) is mutually
> exclusive with the other conditions, so checking it first doesn't make a
> difference, and then you can #ifdef things out more cleanly.

This is indeed clever, thanks! v3 soon.

