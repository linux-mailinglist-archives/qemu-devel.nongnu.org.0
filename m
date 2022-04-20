Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09205088FD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 15:13:24 +0200 (CEST)
Received: from localhost ([::1]:36900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhA96-0005ck-0Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 09:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1nhA8A-0004te-Gt
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:12:26 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1nhA85-0001Ok-HN
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:12:24 -0400
Received: by mail-lf1-x132.google.com with SMTP id y32so2909529lfa.6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=yFY00ENzoqo6I9F+iUZdGxgBHHamSdEVh8hBmodVv7E=;
 b=4JXEvk6/OM21OpRpB8K0d0Ems0GjUru7GblvEJo/IOe714M0HwAjRBsLTvL6R5Zjvz
 e7hrtZ2bGtkgvguO8SqekLphRWoHLFD5g/tUhxEG7VWZppvnJyhzQtKTAEur3x6UBENq
 CgC+/quqDec+2CfIviqbYC6tR3Zcr57OYVLE0f2ttQCPwc8wXqpQQr/Dk1fBBvLcF6wF
 VNrt815zYOrWmrU1WXSi2eQHi/GDk+1NfPNOl42K8KUrTL+RuUBOEgiUlFuHtJ1S7gD0
 iFoah5QPcKLDqZ+fdunpGf6qAQV8stVhGcnDsQysA9c6jZFyQ4Z1AgMwyIPtZGxnbaps
 LFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=yFY00ENzoqo6I9F+iUZdGxgBHHamSdEVh8hBmodVv7E=;
 b=L3ybRXR5EZcCTr1u/1emYpFALLPlCOKP6VtxRcGNiJBoKsT8Wo8k2Sx0xokVNpcKew
 DvbfssKc+m74SUFWdal135gUb6ibtKDKbS+nbsEdeq1Jxl9j/lNHT2mKjv3ZDoyWqi2m
 2gr4lHjhl3nr3/S6bLUS5FEVs12hMRMDbMSij5/UrD7PYUBvkYvjw2M1Y77rTzqWRWe4
 yVzI1lVNNVhuPJ4+4U/jHGxc58opokHLD71GuoMppdk8QjAE9qcYeYMAQC+BFA5nVoRf
 x0hIqEymSEbN4Z/Rioa8Pp6TA6YpbzA6YAC5ExeWTnUvJs274bKAtz0hhp0P2hgcSbBu
 oh2Q==
X-Gm-Message-State: AOAM531swC9QSCYaiFHouYr7e01nxncWpLR+2RdAlMLXWmRM75Ui2np5
 sLp1U4C5jK0Z0RBeL6oLokGkJg==
X-Google-Smtp-Source: ABdhPJyJNxl0lZq4lWZaV0IZvA+M4qNVED3sUNbLsZBpy0bXME2Duq8v6n7hne/TnxtyVdr8UHd1Xw==
X-Received: by 2002:a05:6512:1504:b0:44b:36e:b50d with SMTP id
 bq4-20020a056512150400b0044b036eb50dmr14889682lfb.558.1650460338436; 
 Wed, 20 Apr 2022 06:12:18 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:8174:106e:e1b6:39c8:60ea:c05c])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a195009000000b00471948d48c7sm886539lfb.259.2022.04.20.06.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 06:12:17 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:12:15 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Subject: Re: [PATCH v4 0/4] dump: add 32-bit guest Windows support
Message-ID: <20220420161215.73438466@192.168.1.3>
In-Reply-To: <20220406171558.199263-1-viktor.prutyanov@redhat.com>
References: <20220406171558.199263-1-viktor.prutyanov@redhat.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yan@daynix.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On Wed,  6 Apr 2022 20:15:54 +0300
Viktor Prutyanov <viktor.prutyanov@redhat.com> wrote:

> From: Viktor Prutyanov <viktor@daynix.com>
> 
> Since 32-bit versions of Windows still exist, there is a need to take
> live and crash dumps of such guests along with 64-bit guests. So, add
> an ability for 'dump-guest-memory -w' to take dumps from 32-bit guest.
> When running the command QEMU consumes 32-bit Complete Memory Dump
> header passed by guest driver through vmcoreinfo device as it was
> previously done for 64-bit headers. 32-bit vmcoreinfo guest driver in
> upstream virtio-win can fill such a header.
> 
> Changes in v4:
>     - dump-guest-memory command help message is updated
> Changes in v3:
>     - some WIN_DUMP_* macros are replaced by similar functions where
> it is possible
> Changes in v2:
>     - no change in logic, just split patches
>     - first introduce WIN_DUMP_* macros for x64 in a separate patch
>     - rename WinContext to WinContext64 in a separate patch
> 
> Viktor Prutyanov (4):
>   include/qemu: rename Windows context definitions to expose bitness
>   dump/win_dump: add helper macros for Windows dump header access
>   include/qemu: add 32-bit Windows dump structures
>   dump/win_dump: add 32-bit guest Windows support
> 
>  contrib/elf2dmp/main.c       |   6 +-
>  dump/win_dump.c              | 299
> ++++++++++++++++++++++------------- hmp-commands.hx              |
> 2 +- include/qemu/win_dump_defs.h | 115 +++++++++++++-
>  4 files changed, 306 insertions(+), 116 deletions(-)
> 

-- 
Sincerely,
Viktor Prutyanov

