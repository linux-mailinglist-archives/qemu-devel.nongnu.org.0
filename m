Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3052D9042
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 20:43:37 +0100 (CET)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXHM-0007c9-PY
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 14:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1koXGT-0007BX-Cq
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:42:41 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:36536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <diego.viola@gmail.com>)
 id 1koXGR-0000Hz-TK
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:42:41 -0500
Received: by mail-io1-xd2d.google.com with SMTP id z136so14871627iof.3
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 11:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=5ltMO7DsFz7r4WxPGNl+X+JNbjWtW2HZdZKDjJQLFLQ=;
 b=C33Kc9aC+y6+zm6vN7YfUBC1yEqcOTj73GCd9IxIr3lf6wh+etMxYZ1Jx5NC0OrjOh
 XxKD+cQxMry32cC7Km3KfBILG2TWn2qiTSXBVntDczQWFoutuwvpICjb9vkoSaxQjGcQ
 WpJYrlBmOrVL9fsJoIi2uMRED4ZzTe89dZKAtr/ye7l9CFqQuhjmYz7iixF1BqREJlid
 3jRykItCoHQkUKsk0vS06DlGMG5QpeXJpzeLZ95Mik/Okj2vYzltas7ltKlpNpUMQgpy
 6aU0BkxFPf2dPHLZ5Byg7StqEwQ4wjcAtLLEUxe9fmI0r4lbM2jD+mqybOY5z9G9CF/D
 Shbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=5ltMO7DsFz7r4WxPGNl+X+JNbjWtW2HZdZKDjJQLFLQ=;
 b=kxlmy4XI/aMjHXhbrMYDAmdBnfD1H3jJfLXBYeX8CVX2L2tBKf1pd2Mq9Nfd4j0p9Y
 ZTrAXPBMOKIsLGeUdA2iYwfhjC3ubETnDrLBq/u5O3PFXTyaExTNbUQhcxsJ/vhY48X8
 dVQYedMQosUVbGjKtc92BeTnADghy0M2fRkN0ZNmPJ8nLY4Q/nA2NVQT56m2Wx1n2RkD
 e6952lMOmR5D6S2p+HP7b04ImgDwTXWyd4DLhDRjmdx3pyHRXDnOLj8ocLBWHIV6b5O2
 pAQYmlJ/GJysJvFl//FKdVGWS4d7l26K63qVETUp6uCEWIsCVdbSfD+v8XoTcXEEelTA
 Dwkg==
X-Gm-Message-State: AOAM532ctj614iQ/uaG+jluLZblsgtbMnEmloQbem5Vc06SYfZaa2Rxp
 0Nqpo2d4PQ4VzvHbpZn9lmpEbO/fXsxK+D5unvQTpLLV
X-Google-Smtp-Source: ABdhPJySNWbzcXyS3++MiaE15lSN2JsGETBk8IGbWjxFAqUgKXFNKQT7WfFLJzSX4qDp1bZTDin9HcaYFkyovMoUGJE=
X-Received: by 2002:a05:6602:2d0c:: with SMTP id
 c12mr27928281iow.58.1607888558332; 
 Sun, 13 Dec 2020 11:42:38 -0800 (PST)
MIME-Version: 1.0
References: <CA+ToGPHan_XHjy+=3vzefnJ9+EBHkL+BBR2FgM_v-XWcqVkgQw@mail.gmail.com>
 <CA+ToGPHFEsqwUmH-E8ZSkcsPa68dPnXmDBOJBqehev4RnC0t6A@mail.gmail.com>
In-Reply-To: <CA+ToGPHFEsqwUmH-E8ZSkcsPa68dPnXmDBOJBqehev4RnC0t6A@mail.gmail.com>
From: Diego Viola <diego.viola@gmail.com>
Date: Sun, 13 Dec 2020 16:42:27 -0300
Message-ID: <CA+ToGPGi6Qy-DkTFGHQUft0uhn+H6U14zUOUVstjC0s5tCdpmg@mail.gmail.com>
Subject: Re: Slow video output from webcam with qemu-xhci but smooth with
 usb-ehci
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=diego.viola@gmail.com; helo=mail-io1-xd2d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 13, 2020 at 4:30 PM Diego Viola <diego.viola@gmail.com> wrote:
>
> Not sure it's related but I'm seeing this on the guest now when I use
> mpv --vo=drm on a tty:

mpv --vo=drm /dev/video0

