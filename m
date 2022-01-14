Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106148E75F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:22:04 +0100 (CET)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ImY-0007wk-Kh
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:22:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8IkQ-0006B1-AO
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:19:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8IkO-00048R-OB
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642151987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+o4E9kbsFdSGlyTuQ2KQ1SHISb2SXtZl/kCfix5TTD8=;
 b=CB7Xrv3jNpuwJvVuz2YMKQL1sWBQlf02reJ+x+vuJaTOXNGQCo98T9XxF8sQja99NDnRlD
 Hp8kKijofTXZ2vFBMi/Fhyreh+Ss5XmMMEaFZ7dOogWgofG6qZ66+ARGebxon4nxpD9nLP
 OOQrIfIgXfDAKaHiR0PiZM20BZIWr0M=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8--CvzjNW0MXS8EZGxp419Pg-1; Fri, 14 Jan 2022 04:19:43 -0500
X-MC-Unique: -CvzjNW0MXS8EZGxp419Pg-1
Received: by mail-pj1-f72.google.com with SMTP id
 g12-20020a17090a4b0c00b001b313b7a676so8167406pjh.4
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 01:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+o4E9kbsFdSGlyTuQ2KQ1SHISb2SXtZl/kCfix5TTD8=;
 b=bMYObZhE3wp9Ht23H+AuQ0uf1572TmYXNiwgT0CniYXOvNdOh/o6wUIKtKc8CyEPUR
 auoZn3VCYwph6jma8/pJFfkXad0RMcqV1L6TrKyYYMuYeFU9NpXvq5cDlQrglDvXJiiz
 1OJBJjUkzn0kBur+DaXSzy0vuXUX7IhECF+Pa1q+/QiBAFeYOE84k2Pu9F5e0osEcAIN
 3I5pIaXrWF7CDNddrwuVhKj8vSreqHhVDaT6D2pn3wKvlIqBHzHsdQdO3XTMIdNK5a8k
 TtKTCc551WcLlFFi7ToRnaJkdy4KqyqeqBLQsaDA1LyElqT0sKjLlREY1isBa0w4XCgr
 BEug==
X-Gm-Message-State: AOAM532V71SV6Hqzm/mfClBbfZT+8K0VV5p5ZerSb61mVc+IbDKyb18X
 4AAlyG4uRfpz5hnZkvqKlw7DuaBDVN5ENgfEwYunot0skphnmtOoSLW7iw3Mfkdw5t7ESFVrenP
 LOOv04J6J6rXJztc=
X-Received: by 2002:a17:902:76c2:b0:149:7fa3:2ace with SMTP id
 j2-20020a17090276c200b001497fa32acemr8469223plt.64.1642151981738; 
 Fri, 14 Jan 2022 01:19:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4RnH94XSry2Nj/SyaygFOAIwqmQRyRb1atKHBzD/tITSd8uv4BwQdZ6PaAz8CbjcOlCdDjw==
X-Received: by 2002:a17:902:76c2:b0:149:7fa3:2ace with SMTP id
 j2-20020a17090276c200b001497fa32acemr8469205plt.64.1642151981472; 
 Fri, 14 Jan 2022 01:19:41 -0800 (PST)
Received: from [10.72.12.227] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v22sm5440232pfu.14.2022.01.14.01.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:19:40 -0800 (PST)
Message-ID: <3756d550-8f03-4546-f138-9905f0485661@redhat.com>
Date: Fri, 14 Jan 2022 17:19:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PULL V3 00/13] Net patches
To: peter.maydell@linaro.org
References: <20220114050909.27133-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220114050909.27133-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/14 下午1:08, Jason Wang 写道:
> The following changes since commit f8d75e10d3e0033a0a29a7a7e4777a4fbc17a016:
>
>    Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220112' into staging (2022-01-13 11:18:24 +0000)
>
> are available in the git repository at:
>
>    https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 818692f0a01587d02220916b31d5bb8e7dced611:
>
>    net/vmnet: update MAINTAINERS list (2022-01-14 12:58:19 +0800)
>
> ----------------------------------------------------------------
>
> Changes since V2:
>
> - Try to make vmnet work on some old mac version


I tend to hold this pull request since new issues were spotted in the 
vmnet series.

Thanks


>
> ----------------------------------------------------------------
> Peter Foley (2):
>        net/tap: Set return code on failure
>        net: Fix uninitialized data usage
>
> Philippe Mathieu-Daudé (1):
>        hw/net/vmxnet3: Log guest-triggerable errors using LOG_GUEST_ERROR
>
> Rao Lei (1):
>        net/filter: Optimize filter_send to coroutine
>
> Vladislav Yaroshchuk (7):
>        net/vmnet: add vmnet dependency and customizable option
>        net/vmnet: add vmnet backends to qapi/net
>        net/vmnet: implement shared mode (vmnet-shared)
>        net/vmnet: implement host mode (vmnet-host)
>        net/vmnet: implement bridged mode (vmnet-bridged)
>        net/vmnet: update qemu-options.hx
>        net/vmnet: update MAINTAINERS list
>
> Zhang Chen (2):
>        net/colo-compare.c: Optimize compare order for performance
>        net/colo-compare.c: Update the default value comments
>
>   MAINTAINERS                   |   5 +
>   hw/net/vmxnet3.c              |   4 +-
>   meson.build                   |  16 +-
>   meson_options.txt             |   2 +
>   net/clients.h                 |  11 ++
>   net/colo-compare.c            |  28 ++--
>   net/filter-mirror.c           |  66 +++++++--
>   net/meson.build               |   7 +
>   net/net.c                     |  10 ++
>   net/tap-linux.c               |   1 +
>   net/tap.c                     |   1 +
>   net/vmnet-bridged.m           | 120 +++++++++++++++
>   net/vmnet-common.m            | 333 ++++++++++++++++++++++++++++++++++++++++++
>   net/vmnet-host.c              | 122 ++++++++++++++++
>   net/vmnet-shared.c            | 100 +++++++++++++
>   net/vmnet_int.h               |  48 ++++++
>   qapi/net.json                 | 133 ++++++++++++++++-
>   qemu-options.hx               |  25 ++++
>   scripts/meson-buildoptions.sh |   3 +
>   19 files changed, 1004 insertions(+), 31 deletions(-)
>   create mode 100644 net/vmnet-bridged.m
>   create mode 100644 net/vmnet-common.m
>   create mode 100644 net/vmnet-host.c
>   create mode 100644 net/vmnet-shared.c
>   create mode 100644 net/vmnet_int.h
>


