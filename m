Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D328B4BC726
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 10:40:34 +0100 (CET)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLMED-0006UQ-9a
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 04:40:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLMBY-0005d2-G8
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 04:37:48 -0500
Received: from [2607:f8b0:4864:20::102f] (port=53993
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLMAu-0005gc-CM
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 04:37:48 -0500
Received: by mail-pj1-x102f.google.com with SMTP id qe15so10585456pjb.3
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 01:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iqehRaZ/IySJbkttcqrJhGWD2un0MeCB0ZrslGhubuQ=;
 b=dGWNHqNAFDDFezo64afskyOkql/znAdfpXmfZZeMpPtNk3TBw0zL3mwzL9KDxBSUHS
 VjxCsGPAplh4HapwGsajIs0LsjEhUvUvGL1YSDMqNopfvTIklH0WLv1DhXYPeQ9gwMF1
 I3d0mLBlZzHc75pt3sb+aL/PpSnZsgbrk9VccmICCIkCTm3qclkc25dC8usSYVooLDFb
 2HCCRyOjCf0pZXo0UBxTlRJ5GSFmqSVpxw1qekMonL+0qYdsTyCMwR3B5jerYkAy8Mps
 PndVXESYDRNNa37RFTz7ORp/84j7Y0RI/UDe8MGgPArxxEhG3aFR5Qn4n+8420HgK0yw
 wb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iqehRaZ/IySJbkttcqrJhGWD2un0MeCB0ZrslGhubuQ=;
 b=brhdSAmemaJSRoWtK/LefenToo841CKhkc2k2wysNVCVgs7j8PsdKDx7SsKVjERMXj
 bskoFQu5jg9kgUJpGIzUGDF7NWIAIwI1Nn2rQy5PcirBO+NcnkTLUTy7BOFzzhMBotZn
 0PT94IVdnukANO0BCF5ICchlbNCUzJAPNl7CoTDqPcgDw1ODqL3nAYIEyfdFVX9to3th
 HV95kNQ8wBVGEev7baIWZTKKmaqURl5ups6fxj+xi8MlLos+KPgwj/fl1kBEtLfTRZ7z
 fcD8YxhVpOLW2su26xeqmPlMaXpkFXyeGO4ps8aXff7CbbGE3sVmw8G81QONt+SUnFm1
 pNrA==
X-Gm-Message-State: AOAM530nQtb8nVysRpNvuNDxfzLaq7ujndHayTXJOVq4U/gid/KZK/pf
 g5opnJgHrgNQrkZSmGV7t9wdMtQTScr1JRFTCgs=
X-Google-Smtp-Source: ABdhPJxY8hPZtV8KkysLrfS5pwQ/SUbtTJicDRvtyWp546oHsqt+zbkkwhqPdvFSb7XfPzwq+r2RXuC9wNpBOt73Mms=
X-Received: by 2002:a17:902:e8c2:b0:14d:bc86:be4d with SMTP id
 v2-20020a170902e8c200b0014dbc86be4dmr11093133plg.106.1645263426545; Sat, 19
 Feb 2022 01:37:06 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
 <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
 <70c04ba7-d617-580d-deaa-97018192e8a6@redhat.com>
In-Reply-To: <70c04ba7-d617-580d-deaa-97018192e8a6@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 19 Feb 2022 09:36:55 +0000
Message-ID: <CAJSP0QXUiNLQmTap1EgX-fxc5N1OqpN=PY=6x9JdCGxMaMHk7Q@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Sergio Lopez <slp@redhat.com>,
 kvm <kvm@vger.kernel.org>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Alex Agache <aagch@amazon.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, "Florescu,
 Andreea" <fandree@amazon.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, John Snow <jsnow@redhat.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 17:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 2/14/22 15:01, Stefan Hajnoczi wrote:
> > Thanks for this idea. As a stretch goal we could add implementing the
> > packed virtqueue layout in Linux vhost, QEMU's libvhost-user, and/or
> > QEMU's virtio qtest code.
>
> Why not have a separate project for packed virtqueue layout?

Sure, but we need mentors and they overlap with the VIRTIO_F_IN_ORDER
project. Does anyone want to mentor a packed virtqueue layout project?

Stefan

