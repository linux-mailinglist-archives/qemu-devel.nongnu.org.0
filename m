Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3C5EB6AD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 03:12:34 +0200 (CEST)
Received: from localhost ([::1]:57494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocz9F-0003Li-0C
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 21:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ocz8A-0001g1-Mg
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 21:11:26 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ocz88-0001RX-UA
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 21:11:26 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-350cb1c0abaso48910407b3.9
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 18:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5gVe8SJq8JL36oMgYLBV8PFKXJZWEcjx3FIoVsrNI6M=;
 b=GhsVwXMExezyV+YD9siZ5CQHfWkJEVsXRi8ecs4S8L5ojQzNaBuxXUgnM93GN2EcfV
 L8A0PmSx7nqFh3beLl210ReuWGW+Laqu5nDP7q9i0BfZNkm1TuZffc04yYdGAzC79A/Y
 tKp+0dBbN2ZSeja4rGY0FUVAm+h+OPpyKmajNAeg2KBn3sTG5sVDc8d/9LbEh/chiD8C
 pd+ltdinT5X+SlHrvs+NbHT9y/xDqRtnjEetnb894kXFA2Zrh/ht1vCJIQRcv9jhCXYe
 fJ+vVghTttbtWLk4+mPqO/2DMWbdDS/l2TstDli1k8QRZo7MZ+QlQvyuhyRmBYshgnJC
 wKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5gVe8SJq8JL36oMgYLBV8PFKXJZWEcjx3FIoVsrNI6M=;
 b=ndDbXdbFYGUd6JE6wfU1dno9rMJT/g+m/eRLC1kfT+Pr6sbb+6TuLzZWRxKRotKlPm
 3yONJbbcN6QzDBSHqv/SHwErUjC0ZYac0hbG2P7cstvdcoomM1utgi5IqefsDLhTuiHB
 cCv8Mln5QcTp+KARX6IUyir++t4C0EHNrPOh1K+p+vJI60c/MtyWz8EntQ0fq9XNsMiy
 U8ljtuRgo9IjK00Y0UXJ+YUyNKygoHHEitGfLu+9lPjl//HFwjtlr+RmnlGSywIiLq3d
 H0vBtGkXRWUIMCydA/vC8HiMwm7wSwRiKBbhotQzhbTMXSut1zI1rh62JjbaPAUdiAjr
 +RGA==
X-Gm-Message-State: ACrzQf2/vsHiAhqExBOsjfC746+qVVfSDw+neAO1GEL10vcQftXuxVYh
 gSNcjeSWYxkG7pUMZLsJM3Z5bS86Vi/LAsAo0zk=
X-Google-Smtp-Source: AMsMyM5XoCRaPdTYgCNNSRU8KczJXBCFxrEM6ihXoL1prKOFtAqUk3wYKTf6xVmwiOGHaXETQ2svXO613wA34JL14FY=
X-Received: by 2002:a81:6a54:0:b0:345:4292:4dfe with SMTP id
 f81-20020a816a54000000b0034542924dfemr23405463ywc.62.1664241083593; Mon, 26
 Sep 2022 18:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220926095509.3759409-1-kraxel@redhat.com>
 <20220926095509.3759409-14-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-14-kraxel@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 26 Sep 2022 21:11:11 -0400
Message-ID: <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
Subject: Re: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci root
 hubs
To: Gerd Hoffmann <kraxel@redhat.com>, cyruscyliu@gmail.com
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, 
 Laurent Vivier <lvivier@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Ratchov <alex@caoua.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 06:29, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> From: Qiang Liu <cyruscyliu@gmail.com>
>
> I found an assertion failure in usb_cancel_packet() and posted my analysis in
> https://gitlab.com/qemu-project/qemu/-/issues/1180. I think this issue is
> because the inconsistency when resetting ohci root hubs.
>
> There are two ways to reset ohci root hubs: 1) through HcRhPortStatus, 2)
> through HcControl. However, when the packet's status is USB_PACKET_ASYNC,
> resetting through HcRhPortStatus will complete the packet and thus resetting
> through HcControl will fail. That is because IMO resetting through
> HcRhPortStatus should first detach the port and then invoked usb_device_reset()
> just like through HcControl. Therefore, I change usb_device_reset() to
> usb_port_reset() where usb_detach() and usb_device_reset() are invoked
> consequently.
>
> Fixes: d28f4e2d8631 ("usb: kill USB_MSG_RESET")
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1180
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> Message-Id: <20220830033022.1164961-1-cyruscyliu@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/hcd-ohci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This commit breaks boot-serial-test on ppc64-softmmu.

  $ ./configure --enable-tcg-interpreter
'--target-list=aarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu
m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu
x86_64-softmmu'
  $ make && cd build && QTEST_QEMU_BINARY=./qemu-system-ppc64
./tests/qtest/boot-serial-test; cd -

(Yes, the full --target-list is needed because boot-serial-test isn't
built when only ppc64-softmmu is selected.)

Here is the CI failure:
https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22

Stefan

>
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index 72bdde92617c..28d703481515 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -1436,7 +1436,7 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
>
>      if (ohci_port_set_if_connected(ohci, portnum, val & OHCI_PORT_PRS)) {
>          trace_usb_ohci_port_reset(portnum);
> -        usb_device_reset(port->port.dev);
> +        usb_port_reset(&port->port);
>          port->ctrl &= ~OHCI_PORT_PRS;
>          /* ??? Should this also set OHCI_PORT_PESC.  */
>          port->ctrl |= OHCI_PORT_PES | OHCI_PORT_PRSC;
> --
> 2.37.3
>
>

