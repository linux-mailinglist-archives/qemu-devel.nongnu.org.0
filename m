Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE4135A78
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 14:46:03 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipY8Q-0000bO-Bw
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 08:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stevensd@chromium.org>) id 1ipY75-000097-Mt
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:44:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stevensd@chromium.org>) id 1ipY74-0002yC-H2
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:44:39 -0500
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:44412)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stevensd@chromium.org>)
 id 1ipY74-0002ta-8j
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:44:38 -0500
Received: by mail-qv1-xf42.google.com with SMTP id n8so2931079qvg.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 05:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xnUuj/R1pZ9BEEfeZC13Q/U2+y+Js++Xk5V7ipUCERI=;
 b=mNZwe0FrvBkpwSRGK9efMB2D/wuloasVh9w9E62/+Jsf3lV7g4JJyZ/tezUdJwTo4U
 wk/t5wwOsL2Wt/IRA0uE2cbvakkhnlqi4SCvz+UZwTGx2X7QpI9+0ZneU1C++i42fCnW
 EzXoWW8lSXYoQvhPlgZa5dQWEk+omDGNzZoC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xnUuj/R1pZ9BEEfeZC13Q/U2+y+Js++Xk5V7ipUCERI=;
 b=MPfv8IyS+epzXeeL5LqimpoePh7Xh0SGFMFfElfNAxLjD4DKt+E7APvnpRU1CsRWIS
 GYnpb5xHGtFWrj7vHAvWz0mLHqL3G9ho8iJsV+dTtD13edO2UB/f/Q9miWMcHBYvECRa
 UdipYb2LXzYQLXjiHE9qiLDNbmZ8M5m0VZC0hHdWdQSVujts51mKAWqUonVQaox4Tzo/
 vpxYfb2iQ/Ik8mV982FHvo7uLiPbV3L7YS11PypNNZbN8GkEEamfsY55NHJNYzx4SEeH
 +SeGcra2Kapq9BHblN/wkGhDOsuVcWO1YLZ6r+GKBJmo5osJfHbS5h6rbBrlbttiXs0G
 HafQ==
X-Gm-Message-State: APjAAAUxClbv0GCh2btbXjep4TZ4BZLl9OtuUuiowDPyO029s3eudXuj
 KjYxNckMaJTcnFx/6qUnql807sozBffn+jw+VD7CXQ==
X-Google-Smtp-Source: APXvYqyB7mN7odCMCXeENZw0NmznYgYh4877oqe/I4JbXNyp7VXZ8ZMts+tt8zqupb3L5+UuzxKv2blZz2YsY1x14Rg=
X-Received: by 2002:a0c:fc12:: with SMTP id z18mr8995655qvo.17.1578577477214; 
 Thu, 09 Jan 2020 05:44:37 -0800 (PST)
MIME-Version: 1.0
References: <CAD=HUj6FA3VoTJqNa+gmAgVOv9zS7Qk9pdg46EY9NvtJOdz5_A@mail.gmail.com>
 <20200108104002.jxh6amnrazhnamej@sirius.home.kraxel.org>
 <CAOiLmNHMAz6UqxuEsiq6Y_dSNcCvtBrFR-FHG6voJAhpF8SeeA@mail.gmail.com>
 <20200109131218.5xc6zhovbgjavfpv@sirius.home.kraxel.org>
In-Reply-To: <20200109131218.5xc6zhovbgjavfpv@sirius.home.kraxel.org>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 9 Jan 2020 22:44:29 +0900
Message-ID: <CAD=HUj7jdKsWAfmmzO7bpmd3PyHFDA91RKkzKiVbuv8=PT2Qxw@mail.gmail.com>
Subject: Re: [virtio-dev][RFC PATCH v1 1/2] content: define what exporting a
 resource is
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f42
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
Cc: virtio-dev@lists.oasis-open.org, Zach Reizner <zachr@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>, David Stevens <stevensd@google.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 Alex Lau <alexlau@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Keiichi Watanabe <keiichiw@chromium.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Dylan Reid <dgreid@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Pawel Osciak <posciak@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > that isn't just a leaf node of the spec. I think it's better to define
> > 'resource' as a top level concept for virtio devices, even if the specifics
> > of what a 'resource' is are defined by individual device types.
>
> Your patch doesn't define what a resource is though.  It only refers to
> something it calls 'resource' ...

Reading it again, what I wrote was a little ambiguous. Stating things
more clearly, the top level defines an 'exported resource' as a
'resource' associated with a uuid for the purpose of sharing between
different virtio devices. It leaves the definition of what constitutes
a 'resource' to individual device types. Perhaps it would be better to
use 'object' or something instead of 'resource', to avoid the
collision with virtio-gpu resources.

-David

