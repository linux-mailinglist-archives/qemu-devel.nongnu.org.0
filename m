Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F0B4A5C18
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:20:07 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEs8k-00013O-Fc
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:20:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEs4V-0006EU-5a
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEs4S-00065y-V5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643717739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bPZYWph78tOlMwgIljXT0zd3xVwdlPs17bMY19cLcY=;
 b=dXhHOrZwmk9GZRrDPaGPIe3JaT6mYSHiZclnhFJh1ywsaB1gfSZ8BZGLOSJKXaYNDoGZ9d
 ZhydJgCLKY3sX0up0H7munVRFmf11hwSOloHKVMD5XWtaKQ4ma3oDMOkIkB4d/mOSCSli8
 gvL7dOjbp4vm0nKfwCiIEO+yGy7NGHw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-cfMZ38SSNbG01dbuRvlAUw-1; Tue, 01 Feb 2022 07:15:38 -0500
X-MC-Unique: cfMZ38SSNbG01dbuRvlAUw-1
Received: by mail-ej1-f70.google.com with SMTP id
 rl11-20020a170907216b00b006b73a611c1aso6429253ejb.22
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 04:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2bPZYWph78tOlMwgIljXT0zd3xVwdlPs17bMY19cLcY=;
 b=RYtz8t+4nvwY5bynkONRbntx15mcAz60pzSOB9S76homFO7g27vBjRlK7q/HRblNNi
 lsyOGKlbhKKtvG9tPJ40BIpGNfPu7fckFhIoKVb8X0SekfIjkIVl22HvlTX5fYGyY8H7
 x2lr0uQQGjxf1PiafH1JwXJzDHNlsg+a4x2NCuHcNVPfhWPUik+wk7Eb0WD7BbUZj714
 jQFGWjxkvT65fNXrGSyr6Rh5I3ErBrA237Jvc5uDKIJOItdOLQOQZX+K/oqBdaIXDTtS
 hfdBqVoxvOfFyxAV6nwXQ5aAqsG5otaFA1ajfMhloj8YNQEgcgfNuIy6anJwuQtidz1D
 WCAw==
X-Gm-Message-State: AOAM531K858ljAtk1wNZHxwZNjJH6alBIzvg7+gjVJwJ3JtHGuZOm6E6
 eyyBARVCvo148qnq05xj4S/CqOneAgKck1PosOqTzDFVui/ejqPxv+vRfoLrohptZ9s8QFtrPxN
 X5Ftny+/b4hdj3JY=
X-Received: by 2002:a17:907:3ea9:: with SMTP id
 hs41mr21815886ejc.727.1643717737483; 
 Tue, 01 Feb 2022 04:15:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlT4E5DKiEi1s0IlJGLj2xeanrCknGn3W+zzqNHUG3kEVYP00E9WJlKjQtj72JhIWJqBYexA==
X-Received: by 2002:a17:907:3ea9:: with SMTP id
 hs41mr21815866ejc.727.1643717737258; 
 Tue, 01 Feb 2022 04:15:37 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id gh14sm14337248ejb.126.2022.02.01.04.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 04:15:36 -0800 (PST)
Message-ID: <9b67dbed-bced-1521-5044-38ed2cdf79e6@redhat.com>
Date: Tue, 1 Feb 2022 13:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/2] block/export/fuse: Fix build failure on FreeBSD
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220201112655.344373-1-f4bug@amsat.org>
 <20220201112655.344373-3-f4bug@amsat.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220201112655.344373-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.02.22 12:26, Philippe Mathieu-Daudé wrote:
> When building on FreeBSD we get:
>
>    [816/6851] Compiling C object libblockdev.fa.p/block_export_fuse.c.o
>    ../block/export/fuse.c:628:16: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
>        if (mode & FALLOC_FL_KEEP_SIZE) {
>                   ^
>    ../block/export/fuse.c:651:16: error: use of undeclared identifier 'FALLOC_FL_PUNCH_HOLE'
>        if (mode & FALLOC_FL_PUNCH_HOLE) {
>                   ^
>    ../block/export/fuse.c:652:22: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
>            if (!(mode & FALLOC_FL_KEEP_SIZE)) {
>                         ^
>    3 errors generated.
>    FAILED: libblockdev.fa.p/block_export_fuse.c.o
>
> Meson indeed reported FALLOC_FL_PUNCH_HOLE is not available:
>
>    C compiler for the host machine: cc (clang 10.0.1 "FreeBSD clang version 10.0.1")
>    Checking for function "fallocate" : NO
>    Checking for function "posix_fallocate" : YES
>    Header <linux/falloc.h> has symbol "FALLOC_FL_PUNCH_HOLE" : NO
>    Header <linux/falloc.h> has symbol "FALLOC_FL_ZERO_RANGE" : NO
>    ...
>
> Similarly to commit 304332039 ("block/export/fuse.c: fix musl build"),
> guard the code requiring FALLOC_FL_KEEP_SIZE / FALLOC_FL_PUNCH_HOLE
> definitions under CONFIG_FALLOCATE_PUNCH_HOLE #ifdef'ry.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/export/fuse.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index d25e478c0a2..fdda8e3c818 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -625,9 +625,11 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>           return;
>       }
>   
> +#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
>       if (mode & FALLOC_FL_KEEP_SIZE) {
>           length = MIN(length, blk_len - offset);
>       }
> +#endif /* CONFIG_FALLOCATE_PUNCH_HOLE */
>   
>       if (!mode) {
>           /* We can only fallocate at the EOF with a truncate */
> @@ -648,6 +650,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>           ret = fuse_do_truncate(exp, offset + length, true,
>                                  PREALLOC_MODE_FALLOC);
>       }
> +#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
>       else if (mode & FALLOC_FL_PUNCH_HOLE) {
>           if (!(mode & FALLOC_FL_KEEP_SIZE)) {
>               fuse_reply_err(req, EINVAL);
> @@ -662,6 +665,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>               length -= size;
>           } while (ret == 0 && length > 0);
>       }
> +#endif /* CONFIG_FALLOCATE_PUNCH_HOLE */
>   #ifdef CONFIG_FALLOCATE_ZERO_RANGE
>       else if (mode & FALLOC_FL_ZERO_RANGE) {
>           if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {

I believe CONFIG_FALLOCATE_ZERO_RANGE only guarantees the presence of 
FALLOC_FL_ZERO_RANGE, so we probably should check for 
CONFIG_FALLOCATE_PUNCH_HOLE, too, here.

(Maybe in practice FALLOC_FL_ZERO_RANGE guarantees that 
FALLOC_FL_KEEP_SIZE exists, too, but then a check just wouldn’t hurt.)

Hanna


