Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF92F46EB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:55:37 +0100 (CET)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbwG-0004Yl-FM
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kzbu8-0003JY-8K
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:53:24 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kzbu6-0001Ha-Lo
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:53:24 -0500
Received: by mail-pl1-x631.google.com with SMTP id x18so689428pln.6
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 00:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91t8/GrgwdP3J3lpPglK+wAs1o4cSKJJyNpadC4YItE=;
 b=cqzyRtGOd2lGZxSbmUFthoPo2q+rb7QQ3GwlHNdMmfKk1bWUtj8Jae0Y63ruPryMiI
 R47x30fQw1esa1aUk/oAhVzqM3BoAh1NVUF4+jzBYxLfkFsEiZnMwjstoaNa5jM3AQ9j
 jW7XS8I09RaYm8mcGsJlrUjKfpE7bX/rUtWVhRIRRl7j/9+2/iiVYPye+cVi5atNL88K
 IaP4dyBRScn/2s9v6p/mEYbpK9W4OMDUBQXWPAcHK0CgXuKbylFAdK8i2gaahwin50Z5
 kHkXfhPtmbvNRBeUHwFWhUBl2zKAaOYcf3UgdV4prIE/eLmLN6UuEQkcFhmFyefxtE4/
 JsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91t8/GrgwdP3J3lpPglK+wAs1o4cSKJJyNpadC4YItE=;
 b=undUOydZCIMmTUqPoyiSzREVRdSt5ussvDm/S5RWdtY04FMPf4AyVby02btvWvhjaW
 Ll97xZ/8lNdOOhGstBiJm3R0LPZ6KQgWsaHxBMxE/cWvWiOo4KLMLw1f6uV2PsodBgt9
 BR2JG3jFB5Qq/VetVDmKe1thO97ax++S+ilOIJHCucfbcQZGnjetEQ8F9G4KMBVS/rKx
 5JKOVSKspa/IQFE8gsy6ehS5YOYFa1c8ANc5qQrEG4guBvP4afWEuYCz1CLcehcihJxb
 yO9+Euquny9ZJux+aqW+x0lWL+Xpi1//rAn3tf9h4+LUPi7rq00JhAD/9ghQbajrt9Vp
 NYkA==
X-Gm-Message-State: AOAM53321J0sedmR98YW59c9upRqOEgePjw5ZKgJOZQH7W3JUR37xYzY
 KT2j9p5BbxJSWOrMVDrX5aEgfvTYwjKQpqqKnGs=
X-Google-Smtp-Source: ABdhPJzu1Jkywhap5AYCqw/3tp1viBxaqbYyKdQdsxi+NmLuV6cKZk5+1FoGErSLl74qnYKmGCm0jo3SlUeeibhFgeY=
X-Received: by 2002:a17:90a:2e83:: with SMTP id
 r3mr1177711pjd.112.1610528000788; 
 Wed, 13 Jan 2021 00:53:20 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
In-Reply-To: <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 13 Jan 2021 08:53:09 +0000
Message-ID: <CAJSP0QVRohWcfYY7AjispK8+VYat6APc3nNbmAxk+34nZmtFPw@mail.gmail.com>
Subject: Re: Call for Google Summer of Code 2021 project ideas
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=stefanha@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 9:10 PM John Snow <jsnow@redhat.com> wrote:
> I have one that is probably way too ambitious, but requires a particular
> skillset that might be of good interest to a student that has some
> experience in the area already.
>
> The idea is for a TUI qmp-shell (maybe using urwid?) to create an
> irssi-like REPL interface for QMP. The idea would be to mimic the
> mitmproxy TUI interface (Check it out if you haven't!)

Great, I think this project idea lends itself to an incremental
milestones. How far it gets will depend on the intern and we'll be
able to merge useful patches regardless of how far they take it.

Two more ideas:
1. Ability to load libvirt log files for offline viewing. This could
be a major use case for this tool because the raw libvirt logs can be
hard to read today.
2. Ability to watch QMP activity on a running QEMU process, e.g. even
when libvirt is directly connected to the monitor.

Stefan

