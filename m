Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA902B049
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 10:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVB5X-0005dr-E3
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 04:34:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hVB3p-00051r-Co
	for qemu-devel@nongnu.org; Mon, 27 May 2019 04:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hVB3o-0006S8-ML
	for qemu-devel@nongnu.org; Mon, 27 May 2019 04:32:49 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1hVB3o-0006Qy-HZ; Mon, 27 May 2019 04:32:48 -0400
Received: by mail-wr1-x444.google.com with SMTP id m3so16028010wrv.2;
	Mon, 27 May 2019 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VauEy2NEjDgzuyKE8qagG1Egy7OxNTvM5pjfiTtKLJY=;
	b=UMoXYPjiDXyOX2gsPXYAqMVYUmaaY31bNQ8IJe+QBnZiMJGwwP8O8jjw/lEHjshifk
	JnQlnXuVvtFbDVRoKcascN9Hnlxp+hlQ6hYBalqN4yWpb6GQ8diufQ8NjBI+1Jkib5yO
	qXPDvM9qsLXiw+cGWsuUZxvbnDBAIAskoSPWT06XQuvtA7u27AWfVqHJDwTP42v6yPhU
	Un+lX6XanOfyVijte5ZQr23tEy08UWHFNIYkuKZxqXSbGXrlpkvB01gSyjUUKbcodnys
	2x/Xu58H5l2W2B2PG6CcLJotJbi2RGkGQwq8EyPex0kX7iE2TKA1yS61sXxOy/T910Hx
	ZG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VauEy2NEjDgzuyKE8qagG1Egy7OxNTvM5pjfiTtKLJY=;
	b=W85knCkh1I4GGl7c5/tUHgavOm8UG+XBaCMe2JSeJutITmx7oCvwA5hTmdlaRQND5B
	n8pcwFe27LW9Hkt4zgdz4cAKiwAF+gYKW33ii2GHRsOyKjOXSH1ICnA5robnBRpS8fkD
	uX/qbvkxYZ+Oj0zPmmXtnROVAvu/gnauExDTvHDwBIsSlXJ7y6kyMfJy4TlH7xTDxHk4
	Mn+ReN/dImD8EeD1KV5skVzmWE+0tSVOZPEHML/a/rc/f8Kfx7b+Ne8kMjDSBD8bSukd
	iWM3o1zhPcnEEgeT7ek8SjdWzy5StC4+ogETzD/kCmBZHZVrGRI3Hy311sGU6ID+lw2g
	Ib/Q==
X-Gm-Message-State: APjAAAVhbfkxN9fTrNG1wsvAQVmvivffcboRSOdfzf0xRyS3NQgseATW
	tGYqxLHQf8OKIAX6dDFX9LYL99Uc+YGPIPWQLOA=
X-Google-Smtp-Source: APXvYqxiCUAlhbJHF8oftcNRourt48DE9DhvU/9x4FjZ+igziQX22eJaqhMycrFFWlAtZOEBOVwvTv+bqNnEJGJIoSE=
X-Received: by 2002:adf:de8b:: with SMTP id w11mr6105344wrl.254.1558945967015; 
	Mon, 27 May 2019 01:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190527080327.10780-1-mehta.aaru20@gmail.com>
	<20190527080327.10780-6-mehta.aaru20@gmail.com>
In-Reply-To: <20190527080327.10780-6-mehta.aaru20@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 27 May 2019 09:32:35 +0100
Message-ID: <CAJSP0QUHvDZJbNrjh-9x7woedoHHD_VL5Pvj_qc+NOD=sF3FJQ@mail.gmail.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v3 5/8] stubs: add stubs for io_uring
 interface
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu block <qemu-block@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, saket.sinha89@gmail.com,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 27, 2019 at 9:09 AM Aarushi Mehta <mehta.aaru20@gmail.com> wrote:
>
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

