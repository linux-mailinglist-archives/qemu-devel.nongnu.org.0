Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA355718FC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 13:52:22 +0200 (CEST)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBERB-0002Nm-1R
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 07:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBEMZ-0000VE-LN
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBEMX-0007Fq-3A
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657626451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+gV+pO+6KAQOWxSefq09+8h+UFm/vDNYeGx3P8fiS3o=;
 b=X4sk771LavEPEvR4IK+QAgjAfoNdkGkamu2+xreXnVd2nQ4+/FYFZDYxKFpWiUzp/HiJw/
 MCUO8pF9+B8L2UVRNE0RfgG7wDgT4oXkQN713IgFun53HL4V7xbq/nQMr99qfJMcVLR7F/
 0UIiipEk0wx2ufKmiFwTAhD2ybIDyk4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-u4B1w_F6MIi4J4GxPGZ5sg-1; Tue, 12 Jul 2022 07:47:30 -0400
X-MC-Unique: u4B1w_F6MIi4J4GxPGZ5sg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q12-20020adfab0c000000b0021d6dcb51e8so1335202wrc.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 04:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+gV+pO+6KAQOWxSefq09+8h+UFm/vDNYeGx3P8fiS3o=;
 b=aO8/aP4U0pL6OaZUyznzLw1QJ3J8ik2L5b8eYr0IUR63xjE2twryCJyxybsITFl9DQ
 OP2WrH5/A5iVkqz91UCARxmyMogK74sFj6rAYq+3lFH4fbjZsnefoks9K9N37YbAfc0f
 d3gEwYQrQ0z+EacQGd7ij4Uw5XSjVtDnA7ybGZjx7o4LENKDXUNhZXQ7ZYpnw9uKA8Ub
 fdCDDYMpGiSRiwEbp6A/zPu5FEk9xsU9RIXEHkCHzS2qQHbYIUzbB/tZHzO379YsRqHU
 FWxSoOKAOQza0pZxI03h7U3Mlp6ZAaTLGgBpEGxULkM1vACRuSd09RmuAoV0Muaf+k9k
 UUvA==
X-Gm-Message-State: AJIora8gq7uSXoCBmlXPXdPIYH7bcQFVDSb71e4gVOXF0rWiKfTuouRh
 0xfNBPPVAOFJeqModMEJTK2lzX//JnMOFafo6sOo/wYuaJAwE0wHp5xtnaWYDyl2ZkM4/L99vcz
 RkXR4BfEMcYCYxvY=
X-Received: by 2002:a05:600c:1548:b0:3a1:95fc:aa42 with SMTP id
 f8-20020a05600c154800b003a195fcaa42mr3381856wmg.189.1657626449069; 
 Tue, 12 Jul 2022 04:47:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uOay2MBGm3sdI8kpu8S8uBIjA9QhxMebXQqEokkNDId3UM3bffOkfmew93SRIf699zVgv9DQ==
X-Received: by 2002:a05:600c:1548:b0:3a1:95fc:aa42 with SMTP id
 f8-20020a05600c154800b003a195fcaa42mr3381824wmg.189.1657626448651; 
 Tue, 12 Jul 2022 04:47:28 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a5d6912000000b0021d888e1132sm8086027wru.43.2022.07.12.04.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 04:47:28 -0700 (PDT)
Message-ID: <b0d8798f-b080-14c0-bba8-8686a35d7b33@redhat.com>
Date: Tue, 12 Jul 2022 13:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] qemu/qsd: Unlink absolute PID file path
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220609122701.17172-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609122701.17172-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On 09.06.22 14:26, Hanna Reitz wrote:
> Hi,
>
> QEMU (the system emulator) and the storage daemon (QSD) write their PID
> to the given file when you specify --pidfile.  They keep the path around
> and register exit handlers (QEMU uses an exit notifier, QSD an atexit()
> function) to unlink this file when the process terminates.  These
> handlers unlink precisely the path that the user has specified via
> --pidfile, so if it was a relative path and the process has at any point
> changed its working directory, the path no longer points to the PID
> file, and so the unlink() will fail (or worse).
>
> When using --daemonize, the process will always change its working
> directory to /, so this problem basically always appears when using
> --daemonize and --pidfile in conjunction.
>
> (It gets even worse with QEMU’s --chroot, but I’m not sure whether
> there’s any trivial fix for that (whether chroot is used or not is
> confined to os-posix.c, so this would need to be externally visible; and
> I guess the plain would be to skip the unlink() in that case?), so I’d
> rather just skip that for now... :/)
>
> We can fix the problem by running realpath() once the PID file has been
> created, so we get an absolute path that we can unlink in the exit
> handler.  This is done here.
>
> (Another way to fix this might be to open the directory the PID file is
> in, keep the FD around, and use unlinkat() in the exit handler.  I
> couldn’t see any real benefit for this, though, so I didn’t go that
> route.  It might be beneficial for the --chroot case, but then again,
> precisely in that case we probably don’t want to keep random directory
> FDs around.)
>
>
> Hanna Reitz (3):
>    qsd: Unlink absolute PID file path
>    vl: Conditionally register PID file unlink notifier
>    vl: Unlink absolute PID file path
>
>   softmmu/vl.c                         | 42 +++++++++++++++++++++-------
>   storage-daemon/qemu-storage-daemon.c | 11 +++++++-
>   2 files changed, 42 insertions(+), 11 deletions(-)
>


