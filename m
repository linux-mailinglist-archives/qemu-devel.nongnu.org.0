Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812812FBC8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 14:56:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWKbB-0004Tq-O7
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 08:56:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hWKa5-00047G-S1
	for qemu-devel@nongnu.org; Thu, 30 May 2019 08:54:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hWKa4-0005XM-45
	for qemu-devel@nongnu.org; Thu, 30 May 2019 08:54:53 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34878)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hWKa3-0005UD-U2
	for qemu-devel@nongnu.org; Thu, 30 May 2019 08:54:52 -0400
Received: by mail-oi1-x235.google.com with SMTP id y6so1212297oix.2
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=arSGMF0EHSmPwohYo5hXUKuMRWeA6PEHARITBOIAbaY=;
	b=EnMy75bNl9RmXdbMqmDGiaFlSbaIUzoUscztUQ9KFW1xDdXjPj9QMMeL5mu9bjYMhq
	QoLN9Kgm556+QB9J8Wwk0kODU3bTv3lD6+hAfLfP8dkk98v8SDp6x9lLbdpMcoGOcCsR
	YCChBsshT/o4/SsjWirM2WItMwyLaywlXcNsE9o/64s1K+bq2IJSiHqtdKvAKXsrK0+L
	8PAjdWVof1cyRgJ/vmvyKvsS1rwqGSqNlwcTS6f+ESga94oqnUxGSEc1TicydE1A1KHZ
	BYQyiOFat2fdomT/mZRPZB2U7YXjk9IWyx0W3hdTxSxDhunV1e0g3gGNJ7KtwGLxtN3L
	MVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=arSGMF0EHSmPwohYo5hXUKuMRWeA6PEHARITBOIAbaY=;
	b=KwVIZQ1E2DbcpBWuokrHIFkIuE0b66vY4KVXWDTfv0FtSk6UiTNEFU6tQLWoQRlvMS
	uDmRQ316CP58ID40Zn5Xf9kVIhw9cd3pgayCYsJ+xubv7oviagCb8WhrJFFjjAPYePXg
	nYYnojAeRD8R0trJSxVY/LNObhriICBv6OBfsaWzgVJV0m1xMt28OsNwBwZx9SBuYWRK
	9GdCzXJ4OdLm9l7/hCMOPailApOgkW4R5Kt1Jy90kuKKt2iw96fsYEgt50lWPsgcKzm8
	rhiByE9UyQjPeWkS09ILZkv8IcUx/K37DcBwWrP8nmw7qFIDXXcN+JK0W4ZXR+IX0cKi
	vTZA==
X-Gm-Message-State: APjAAAVxheK0AQHGG5G/cL6Jc28kUo2Y9IEzpLTsqPZYVmcs8+XBS5bk
	kUzF7oWWIcc3yBwoAB0mrbk1NMLIJevp/AocAmL5zg==
X-Google-Smtp-Source: APXvYqyt5f86m1hFHPOqimrWaj39Uv7lI+HS4lidxjcrLW3husjI3HgfSC6DEiOVZe8mnKrTZ514SP8a/bw7dtFIw5E=
X-Received: by 2002:aca:cd12:: with SMTP id d18mr2255928oig.146.1559220889840; 
	Thu, 30 May 2019 05:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190529044020.27003-1-kraxel@redhat.com>
In-Reply-To: <20190529044020.27003-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2019 13:54:38 +0100
Message-ID: <CAFEAcA-jsLaezEzPi_E3Q7EjBahmPAbYyUcRqobZNOnQ1yYktQ@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::235
Subject: Re: [Qemu-devel] [PULL 0/9] Vga 20190529 patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 May 2019 at 05:42, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit da35f7f1eeff9f249a9597400fc514c83fd3a0=
f8:
>
>   virtio-gpu: add sanity check (2019-05-28 08:14:44 +0200)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20190529-pull-request
>
> for you to fetch changes up to 267f664658fee4138f80013fa25354191e8091cb:
>
>   hw/display: add vhost-user-vga & gpu-pci (2019-05-29 06:30:45 +0200)
>
> ----------------------------------------------------------------
> vga: add vhost-user-gpu.
>
> ----------------------------------------------------------------
>
> Marc-Andr=C3=A9 Lureau (9):
>   vhost-user: add vhost_user_gpu_set_socket()
>   virtio-gpu: add bswap helpers header
>   virtio-gpu: add a pixman helper header
>   util: compile drm.o on posix
>   contrib: add vhost-user-gpu
>   spice-app: fix running when !CONFIG_OPENGL
>   virtio-gpu: split virtio-gpu, introduce virtio-gpu-base
>   virtio-gpu: split virtio-gpu-pci & virtio-vga
>   hw/display: add vhost-user-vga & gpu-pci
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

