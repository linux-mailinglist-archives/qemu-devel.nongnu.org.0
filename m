Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C25505EAD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 21:47:06 +0200 (CEST)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngXKz-0000qA-E0
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 15:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngXJt-0008Bp-Az
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 15:45:57 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngXJr-0008Eb-Fl
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 15:45:57 -0400
Received: from [2001:470:1f09:1338:0:c0ff:fea8:101] (helo=nowt.org)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1ngXJk-0004k3-2V; Mon, 18 Apr 2022 20:45:48 +0100
Received: from wren.home (wren.home [192.168.93.7])
 by nowt.org (Postfix) with ESMTP id 82DED6DAC6;
 Mon, 18 Apr 2022 20:45:47 +0100 (BST)
Message-ID: <4530fe387ef5a8d294122a1520ad8e25445bf344.camel@nowt.org>
Subject: Re: [PATCH 2/4] TCG support for AVX
From: Paul Brook <paul@nowt.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Apr 2022 20:45:47 +0100
In-Reply-To: <CAFEAcA_HgZmoKO8u_m7XXjKibBuT9HqeOcc+2R9yQkd9-sAdDw@mail.gmail.com>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220418173904.3746036-3-paul@nowt.org>
 <CAFEAcA_HgZmoKO8u_m7XXjKibBuT9HqeOcc+2R9yQkd9-sAdDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-04-18 at 20:33 +0100, Peter Maydell wrote:
> On Mon, 18 Apr 2022 at 18:48, Paul Brook <paul@nowt.org> wrote:
> >=20
> > Add TCG translation of guest AVX/AVX2 instructions
> > This comprises:
> >=20
>=20
> Massively too large for a single patch, I'm afraid. This needs
> to be split, probably into at least twenty patches, which each
> are a reviewable chunk of code that does one coherent thing.

Hmm, I'mm see what I can do.

Unfortunately the table driven decoding means that going from two to
three operands tends to be a bit all or nothing just to get the thing
to compile.

Paul

