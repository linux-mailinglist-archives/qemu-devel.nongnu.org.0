Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8D3B0DA4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 21:27:54 +0200 (CEST)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvm3t-00058J-8h
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 15:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvm37-0004SC-1N
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvm35-0003Lj-Gf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624390022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r0lwqAXjsBIBUkyOdPbC09kT5RcT8IUWK+AhJts6+oM=;
 b=PPiMNVosuW2e9EAyK6GaOYkZR2rSzIyf724Og4UdIxk655wCkDKOF3RpCE2w/zO/T7SXMg
 48qo5WGq9tAvyIXFyHkNX4zWkiQqq/No3MxRa3xYAnxmhfILeu4bpYKWad3rhrzW7XIjCT
 wB9cePYk+i0gp9hkZi/BY6uwu4r9bC0=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-O-W_k7feND6WyMv28xPnnw-1; Tue, 22 Jun 2021 15:27:01 -0400
X-MC-Unique: O-W_k7feND6WyMv28xPnnw-1
Received: by mail-ua1-f72.google.com with SMTP id
 k65-20020ab043470000b029027cb996995fso2564642uak.18
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r0lwqAXjsBIBUkyOdPbC09kT5RcT8IUWK+AhJts6+oM=;
 b=gxsHx12tjdVSgXg8yi+FlD9qH+jP8vM+PZIGknRM/pQB40/qm+SmyE34kJhFUQByCJ
 ubOf/ukovneqqCarGZYo3i/ecOlyjK/HJyAggw+20qfZ/7MoT6gyG857RXZL0h+RgfQi
 LOItFX+nqd9Ia4c6SE0tPuRPvHbsuFou7bWXFTIK80yO8EsZS6jO6tQU3IhIeLFNyEa9
 6cSKoX/l9Vd37bm9+YRkjUiHzgNwasYm8z2DnIDV7gQEKkjQDb1nUnvHeS1l1PhFJyte
 rlfZnGq0Bry3kfbmPBdx3AlzA3Oq0tzEtoB/3simDUwCWq4JivLeJ71UuCubeFlFVkQr
 6Mng==
X-Gm-Message-State: AOAM530MEWRwxUhtvzhc5muuNi+B7X9FG/Vc+0qt2X7suhfp5N5BXlCv
 40rLtkllRfyw9HfDd3MqDZ9aRoaeyGVJ31O/WdKnL3LHWNBO0NnkHfGQZtqv18Fxyi3/udPostm
 TQyeLVpPve8ipKS8n/ixtf54fvHj6uY8=
X-Received: by 2002:a67:d80f:: with SMTP id e15mr10017636vsj.50.1624390021020; 
 Tue, 22 Jun 2021 12:27:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHDGA0WApBNl8Ucxi8htRUehkO3Oln3KnoDqK71p/BLGmA/6zBZ51xNt9Xj9DBGp8CLV8TaIxTH+cmWQRC1Z8=
X-Received: by 2002:a67:d80f:: with SMTP id e15mr10017621vsj.50.1624390020872; 
 Tue, 22 Jun 2021 12:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
 <162332429961.194926.12492368578557666684.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162332429961.194926.12492368578557666684.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 22 Jun 2021 16:26:34 -0300
Message-ID: <CAKJDGDbb2Tv0vJ5SAZ_ME4N9o5iU-PkQz5xGt0F1KW4BGzZyMA@mail.gmail.com>
Subject: Re: [PATCH 3/6] tests/acceptance: add replay kernel test for openrisc
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 8:25 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch adds record/replay test which boots Linux
> kernel on openrisc platform. The test uses kernel binaries
> taken from boot_linux_console test.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/replay_kernel.py |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


