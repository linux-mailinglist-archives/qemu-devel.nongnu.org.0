Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7092B40E7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:20:25 +0100 (CET)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebcW-0004WY-Pb
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kebbU-00046f-5l
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:19:20 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:33842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kebbS-00086Z-6P
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:19:19 -0500
Received: by mail-ed1-x544.google.com with SMTP id a15so18146270edy.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 02:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30UNeIYvZeeOatsqxOuMTlux/JAngHTyzEg7w08T+gU=;
 b=vREbNb3LzM/UwGck7OW/1WwB4uUyAUOLe/Ey//G0ZCYY+3vcWj4XVKTz5kjq1E1Y23
 9qYYa0i8TVRctYJ2Me4HhvQ+xQbl3WoucY288UNodiieerLP28FVIfOsEtpaXB73m6ks
 FquP8n/oSMKaJSBH1wv+bDlZ6wlzXedy2gFHzW6sa4e6k3VxmfHaMruOOSvskwtwwFee
 BmD4GKIg0mj345XFDacrp8hojyoPNs40rKx9DgNPXv1BxqRUBVMCQr1vJNmtnxCJLu8q
 gfhzct8S18aCZBbjAZ4QG94X+ieQvwUDkk3mCqr0xT2FU+ntCvajSIqEjPo5TeVaEu7z
 Gh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30UNeIYvZeeOatsqxOuMTlux/JAngHTyzEg7w08T+gU=;
 b=JlFwHWwNF+hQTo8XQwSsh2sk8A/l9sl9Xf+sDHztQetet8serheWJCVZpc/Z62TytO
 GWFy+WGsa2BM39YSjtOsI9OLDGJGOcN/81w7YahloMFNfKDZaQerEF1qda6QUqL6qSlw
 bbx7TnfKBatNQbMy9kuBlPiYOX4LOokXvifnBQ4e6zn6RfB3bpM22F5y+EuQvCYMUEws
 Sd6XaxHxQJXdhB5jNrEMhpi6F4l/j/UummPJFLOIL7MyIISdn6CmWDlt8J+yq1/f9hBm
 QU4TlWe5UwqpJOMnhOI+jXY0HgEoggX3Kjv7FOo5VeaeNjJ/FNsOl4zp+5Ywc2ufvZRf
 nDtA==
X-Gm-Message-State: AOAM532Ov6xA0WLor7EpS/I8KeAj5rAT/57yqA33rvF9OGLGdK0HxlLu
 Ok7LZLbkjQ7jDm0luzvMJBEi2ooFl7DVuVy6vbf1HQ==
X-Google-Smtp-Source: ABdhPJzmpnJm8p5NV4+4GTC/xtW98DgiMPkENCCI+ZSGuJgVZYSi/7i90tdgTcyRnN/S2XMRifhqfdM6cOKyZR98cQ4=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr14772644edb.146.1605521956134; 
 Mon, 16 Nov 2020 02:19:16 -0800 (PST)
MIME-Version: 1.0
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <BY5PR02MB67725D033C3725C001D0AE05CAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB67725D033C3725C001D0AE05CAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 10:19:04 +0000
Message-ID: <CAFEAcA-eR+BkbRGWAEh-6HFXgx2DkHZrxf2=tBprw-H6mm4kfw@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] Add Versal usb model
To: Sai Pavan Boddu <saipava@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 08:10, Sai Pavan Boddu <saipava@xilinx.com> wrote:
>
> Hi Peter,
>

> Does these changes looks good ?

Hi; this is on my to-review queue, but I'm currently
prioritizing work that will go into the 5.2 release.

thanks
-- PMM

