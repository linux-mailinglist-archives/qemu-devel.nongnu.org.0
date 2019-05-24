Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555829429
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 11:05:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU68x-0007lJ-Ns
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 05:05:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU67R-0007AJ-0i
	for qemu-devel@nongnu.org; Fri, 24 May 2019 05:04:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU67Q-0004kd-29
	for qemu-devel@nongnu.org; Fri, 24 May 2019 05:04:04 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:32782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hU67P-0004jY-Tb
	for qemu-devel@nongnu.org; Fri, 24 May 2019 05:04:04 -0400
Received: by mail-ot1-x344.google.com with SMTP id 66so8074437otq.0
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LcSWfYLa7C58X8AEg/i69Suhxk5Dy5K6Pdaqceycwi8=;
	b=hI7TmRGyxc+7j2p0lHSQuJXmIL6j+ZDyrCHxWKOt6tTlbVL+n1w7eryLWAW9Q/xEUO
	XPSlAcpRUBqAWN+D02y6imOuaA/NyibXtqgyvy9vrTqhqoUXTg8PHXsShvCtBI3YJRtU
	xB8voe0nPBU3lvPDY4zKGdrOwfCCE1scf8jdOjQlvLLAOvYHC9nLwmzUyGGnCrPNYLS6
	i3qsRAzwiVl37ZjBOeSPAkS022VTck66UETO0DoQrALZN2LMSgMAxQKqK1bzaEJqJa0X
	rIqAkXlTEgfFGeFTw+hci3b55QZfSyXcMtM7tPqWDWte7srgdnA3Rxdw6y23lPRskEV3
	e5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LcSWfYLa7C58X8AEg/i69Suhxk5Dy5K6Pdaqceycwi8=;
	b=kRu0hBxldE8vj02eOFThEKSkZ3E+9ZPioiedcWzz8iP7mAjMKllSnoBTqjObKQSJ42
	yJ40qWir44SoK3xUkUFI3a7Rxw5s0Db2wJsrk4atwOooV3QnodMvs3uLlXsd/umN+caA
	WGPhzqpJw96QP62KF831GY1PA4eyaysdWfggI2bmT8zPVVuCHozIF3RCMVjVKmAxJD0Z
	58Itz7qxliV8mCOWwrcT8wp+21fekxyp1DRnP+m7MFGNfECuRhZ1MI+sGJWzfs5ikl4+
	tWMuN9HUDS7fcsGYaEPVPM4vUf/7L6wryroSScRJEclq0wUCI+h8LkHXHqQ3wNyYvvcN
	NlGw==
X-Gm-Message-State: APjAAAXELgkvumPtrvytUjrQoD/HYSzCTPu9RedSH6x4W9xk3TG5ndi2
	6h5V0/TklvtpF4E1EZMZl3+68h30ZOMcDgaUVYg3AA==
X-Google-Smtp-Source: APXvYqztXkskc8Jc81v/jqx7tNVzPdkwwrj9P/WaD+bH2i9qF4rbfYycDuo5ZQL6FH0E3oyT5062LoWvWdz30o7AOoM=
X-Received: by 2002:a05:6830:149a:: with SMTP id
	s26mr30968003otq.221.1558688642248; 
	Fri, 24 May 2019 02:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190522222224.244714-1-rkir@google.com>
	<20190523102225.GA2994@work-vm>
	<CAOGAQerwpqaP=DKxC+WVdJcGpxnAayfMrwoPP=bBJBBG5Vn87g@mail.gmail.com>
In-Reply-To: <CAOGAQerwpqaP=DKxC+WVdJcGpxnAayfMrwoPP=bBJBBG5Vn87g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 May 2019 10:03:51 +0100
Message-ID: <CAFEAcA9bKQukg7_HcGKWAFmoaX+DG0NhSctzwg7mpVJ_AOO09g@mail.gmail.com>
To: Roman Kiryanov <rkir@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] vmstate: Add VMSTATE_OPAQUE to save/load
 complex data structures
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Lingfeng Yang <lfy@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 May 2019 at 18:02, Roman Kiryanov via Qemu-devel
<qemu-devel@nongnu.org> wrote:
>
> Hi Dave, thank you for looking.
>
> > Can you give me an example of where you would use it?
>
> We use it in our host memory sharing device. I used the existing
> macros for all fields I could, but unfortunately some state does not fit
> into them. We use this new macro to save/load memory
> allocators (for now we have malloc, but we are working on adding
> Vulkan calls). For now the state looks this way:
>
> class Allocator;
> unordered_map<int, Allocator *> state;
>
> class MallocAllocator: public Allocator {
>     unordered_map<int, vector<char>> state;
> };
>
> class VulkanAllocator: public Allocator {
>     // TBD
> };

This is all C++, so it's not relevant for upstream QEMU...

In any case, migration state on the wire needs to be
architecture/endianness/implementation-independent,
so you can't just send raw complex data structures -- you
need to marshal these into something else (by having
pre-load/post-save functions in whatever device is using
these to marshal between the complex data structures and a
plain-old-array-of-whatevers, or by having the migration
code specifically support migration of the complex data
structures.)

thanks
-- PMM

