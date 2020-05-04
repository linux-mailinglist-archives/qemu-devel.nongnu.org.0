Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB61C3EFA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 17:52:05 +0200 (CEST)
Received: from localhost ([::1]:34062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVdO0-0001Cn-S8
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 11:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jVdGG-0005YA-TY
 for qemu-devel@nongnu.org; Mon, 04 May 2020 11:44:04 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jVdGF-0008Dy-Uw
 for qemu-devel@nongnu.org; Mon, 04 May 2020 11:44:04 -0400
Received: by mail-wr1-x441.google.com with SMTP id y3so2496633wrt.1
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RNVwCExpinKLbC+knXSl1dCu2kPKygsdfJNuCh7loes=;
 b=t/sKZ9NNlo4TLVl1PeuNO1VPBkyipetxgnebedlOc8B3bHy4Z+EalKsvAJhx6hLsYV
 1bfiU8RS1udlov0lh1cR3AlaN6dv1ZvjoQrHiLZoS62flu4NDDAsPrkZVCgC8PMy4N+3
 0x+ra4CB83CmOPFqCdSJ/x1hiiQhxKw7T/Q6xxxKe/OspoSseAjwj6d+KDhu26NazJC0
 ozs5okAn6jhIHIHgZ+YRNtHsuzYJFFFpFVOLd72OBgeDmJ7Y394rq5wU2oupDPlhX6Jn
 ecLXHa5dvnuhGbwdZHFphT2mwo8jIXyuCoIBJTcQY5Zi1k1uCY/Ic/Nxa9nHeMK67aBR
 Tr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RNVwCExpinKLbC+knXSl1dCu2kPKygsdfJNuCh7loes=;
 b=qy/1FFCS95TvoobwKiipAiClagcKtmIfyMRSR37lN1s54gPncjaRMczKG50zX/376t
 wcKExuK39ckj7AF/03kXk2ePv3BRoEJ3VqwPaHGNHe3vMYU7sNn3xO1iTYQ0Ro8ePpXi
 HY46L9CRtrTJw7EXioc4Xyr69pDbiutXSuKPU8bf1CAHeyK/SlPUOnOkeWUW93h6tLgJ
 g1JxUtCLdJJqkWlUMUtDgkHjFne0HhhFO/GbNgUjrFnveFrKmh26bb6Qd0KT9n/sqhQp
 wpir+fnL6dDDABYMSVLNjTO7lpO8YbTjjKB6O7N+BOGYi6cBrmXdYj/JqIOGfn8yAF+e
 /qBQ==
X-Gm-Message-State: AGi0PuasO0WKNmbvwrlvgfW2JTLfkICzDBAqgumzseg3eRMymSqQ+AyF
 3AuiYovACQUtYx6cVqRlI7zpIywxehkIRjlQ6Pc=
X-Google-Smtp-Source: APiQypKEiluGmgu7swTYFdx9cGouHCegW2DZpoI+oGf+q6ZQxlmbAE+Q/v5W+JHL9kYJcE+9VPF6K715FPjPn2ocpKQ=
X-Received: by 2002:a5d:6609:: with SMTP id n9mr2955948wru.32.1588607042460;
 Mon, 04 May 2020 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <348d4774-bd5f-4832-bd7e-a21491fdac8d@www.fastmail.com>
 <CAJ+F1CJsBRp+9yf=kGZt18APXskO8NWyQ1YEqauLYhiNmcW39Q@mail.gmail.com>
 <47c7707a-b5c5-4d25-8d86-ced4741f6a27@www.fastmail.com>
In-Reply-To: <47c7707a-b5c5-4d25-8d86-ced4741f6a27@www.fastmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 4 May 2020 17:43:51 +0200
Message-ID: <CAJ+F1CK441uAWy9s78AytXvPxnCWjjBW2cMkiDGS8GhHpVzZXQ@mail.gmail.com>
Subject: Re: [PATCH] virtiofsd: Use clone() and not unshare(), support non-root
To: Colin Walters <walters@verbum.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, May 4, 2020 at 4:27 PM Colin Walters <walters@verbum.org> wrote:
>
>
>
> On Mon, May 4, 2020, at 10:07 AM, Marc-Andr=C3=A9 Lureau wrote:
>
> > Now that systemd-nspawn works without privileges, isn't that also a
> > solution? One that would fit both system and session level
> > permissions, and integration with other services?
>
> This is a complex topic and one I should probably write up in the bubblew=
rap README.md.  Today for example for CoreOS, our build and CI processes ru=
n inside OpenShift (Kubernetes) - we aren't running systemd inside our cont=
ainers.

Actually, I mean systemd-run (oops!)

>
> bubblewrap is a small self-contained C wrapper around the container syste=
m calls basically.  In contrast, AFAICS right now, nspawn requires systemd =
- which won't work for our use case.
>
> Really the contention point here is systemd's dependency on cgroups for p=
rocess tracking; in a "nested containerization" scenario you often just wan=
t the cgroups from the "outer" container to apply.  But having nested mount=
s/pid namespaces are still very useful.  (That said, cgroups v2 allows sane=
 nesting, but we aren't there yet)
>
> Also related is https://github.com/kubernetes/enhancements/issues/127 - w=
ithout that one requires privileged containers to do nesting.
>
> Now honestly, probably an even easier fix is `virtiofsd --disable-sandbox=
ing` because we fully trust the code running in these VMs.
>
> Or to directly respond again to your proposal: systemd-nspawn as an optio=
n may work for some cases but won't for mine (I don't want virtiofsd/qemu i=
nstances to "escape" the build container or run separately).
>

You can run within your parent slice, and even more conveniently with:
https://github.com/systemd/systemd/pull/15362


--=20
Marc-Andr=C3=A9 Lureau

