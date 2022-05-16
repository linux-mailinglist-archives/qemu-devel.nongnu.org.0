Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDC852932C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:52:12 +0200 (CEST)
Received: from localhost ([::1]:40962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqidP-0002Ok-MB
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqi9k-0005hF-EP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 17:21:32 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqi9i-0003Eq-2Z
 for qemu-devel@nongnu.org; Mon, 16 May 2022 17:21:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id i17so15622580pla.10
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HYjW48Ga+fUxjQ7t6EV+gbUB0a2YfxB0A+Ezs5M+gn8=;
 b=jqf9YHBFvsRmiZNxhNvlF46Hc6wE5F1h/O7HZW1qRoZrD8I7Y738IIf5UpOB2S3ywT
 5sS/VogaSMdxHIZI7orIKDrPEyLBpD23ZDX/p39/ou8yXW7qZ5RVoNDlFdsNcINL65Ht
 Tgq/hX3qDZYIAyIIwVCtOG0ifslPlA3ZPWtLWiSqh3L9SWpLJDBocR27lGL2cYh1e7y0
 kOJBOdO2XbJ6t+w902CAfyfEhGeIiesXt32toj79dMGUpz69H9hiAmMtEpC4M7ah+S33
 zAAW0CoP9oSb7v34vJDTD/sBkE9SwoJYWXnzF16xD21NLBi0sb4wmtOc9Hi31UkH/uPr
 1eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HYjW48Ga+fUxjQ7t6EV+gbUB0a2YfxB0A+Ezs5M+gn8=;
 b=lwKohzJF1v55819Ig4VQH3oK/4lXN/7mFAZteHNKzSuqNkS286u76E4SDhscXn0wSm
 msp+BaFlF6W4DdVaNzWWk3SjNatWHopweTDNIHlvMGIPekycOP6vAIi2PXzwAM5A/l04
 ej42vC3NgKh7V7CtLMfens+c3UHWe6Ts07auBGgef4NhKWWlQtYNKv+5oHQ+CJCezRaX
 u8bt5Vju98JcDvQxFx+sBJ4cBhP0DkHIt3U1YXDFI+eW1t/K2mFQSLio77VRBELd/bnY
 3dZW38ML4K2izVkkH+crKPvQGt8TT8jsT6mloLt80DrHWG+OtTnytKGjSeLJIXbuMUQ6
 /EdQ==
X-Gm-Message-State: AOAM531lKB3KCFXsMUdTExDzKGOEiBoNlhbPht8HVQNhL1CgG+gqpQ1k
 DJFUHaFCphwJNfPt3NGFSLWcqQ==
X-Google-Smtp-Source: ABdhPJxbskYi4mCEdkaYvQo+iXEZb2bn9AeD/qgHrQSzgsToim5bqAy41e1ak/iY8Xk4aK8+Lvm55A==
X-Received: by 2002:a17:902:74c5:b0:161:5061:9d93 with SMTP id
 f5-20020a17090274c500b0016150619d93mr12568943plt.171.1652736088279; 
 Mon, 16 May 2022 14:21:28 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a63f00d000000b003c14af50606sm7228851pgh.30.2022.05.16.14.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 14:21:26 -0700 (PDT)
Message-ID: <c811b838-0f28-7553-db80-5ca14b2111d9@linaro.org>
Date: Mon, 16 May 2022 14:21:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/17] migration queue
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
References: <20220516153812.127155-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516153812.127155-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/16/22 08:37, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 10c2a0c5e7d48e590d945c017b5b8af5b4c89a3c:
> 
>    Merge tag 'or1k-pull-request-20220515' of https://github.com/stffrdhrn/qemu into staging (2022-05-15 16:56:27 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220516a
> 
> for you to fetch changes up to 5b1d9bab2da4fca3a3caee97c430e5709cb32b7b:
> 
>    multifd: Implement zero copy write in multifd migration (multifd-zero-copy) (2022-05-16 13:56:24 +0100)
> 
> ----------------------------------------------------------------
> Migration pull 2022-05-16
> 
> (This replaces the 28th April through 10th May sets)
> Compared to that last set it just has the Alpine
> uring check that Leo has added; although that's also
> now fixed upstream in Alpine.
> 
> It contains:
>    TLS test fixes from Dan
>    Zerocopy migration feature from Leo
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (9):
>        tests: fix encoding of IP addresses in x509 certs
>        tests: add more helper macros for creating TLS x509 certs
>        tests: add migration tests of TLS with PSK credentials
>        tests: add migration tests of TLS with x509 credentials
>        tests: convert XBZRLE migration test to use common helper
>        tests: convert multifd migration tests to use common helper
>        tests: add multifd migration tests of TLS with PSK credentials
>        tests: add multifd migration tests of TLS with x509 credentials
>        tests: ensure migration status isn't reported as failed
> 
> Leonardo Bras (8):
>        meson.build: Fix docker-test-build@alpine when including linux/errqueue.h
>        QIOChannel: Add flags on io_writev and introduce io_flush callback
>        QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX
>        migration: Add zero-copy-send parameter for QMP/HMP for Linux
>        migration: Add migrate_use_tls() helper
>        multifd: multifd_send_sync_main now returns negative on error
>        multifd: Send header packet without flags if zero-copy-send is enabled
>        multifd: Implement zero copy write in multifd migration (multifd-zero-copy)
> 
>   chardev/char-io.c                    |   2 +-
>   hw/remote/mpqemu-link.c              |   2 +-
>   include/io/channel-socket.h          |   2 +
>   include/io/channel.h                 |  38 +-
>   io/channel-buffer.c                  |   1 +
>   io/channel-command.c                 |   1 +
>   io/channel-file.c                    |   1 +
>   io/channel-socket.c                  | 118 ++++-
>   io/channel-tls.c                     |   1 +
>   io/channel-websock.c                 |   1 +
>   io/channel.c                         |  49 +-
>   meson.build                          |  12 +
>   migration/channel.c                  |   3 +-
>   migration/migration.c                |  52 ++-
>   migration/migration.h                |   6 +
>   migration/multifd.c                  |  74 ++-
>   migration/multifd.h                  |   4 +-
>   migration/ram.c                      |  29 +-
>   migration/rdma.c                     |   1 +
>   migration/socket.c                   |  12 +-
>   monitor/hmp-cmds.c                   |   6 +
>   qapi/migration.json                  |  24 +
>   scsi/pr-manager-helper.c             |   2 +-
>   tests/qtest/meson.build              |  12 +-
>   tests/qtest/migration-helpers.c      |  13 +
>   tests/qtest/migration-helpers.h      |   1 +
>   tests/qtest/migration-test.c         | 867 +++++++++++++++++++++++++++++++----
>   tests/unit/crypto-tls-psk-helpers.c  |  18 +-
>   tests/unit/crypto-tls-psk-helpers.h  |   1 +
>   tests/unit/crypto-tls-x509-helpers.c |  16 +-
>   tests/unit/crypto-tls-x509-helpers.h |  53 +++
>   tests/unit/test-crypto-tlssession.c  |  11 +-
>   tests/unit/test-io-channel-socket.c  |   1 +
>   33 files changed, 1295 insertions(+), 139 deletions(-)
> 
> 


