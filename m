Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE811415DB9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:03:50 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNS7-0002uz-Hd
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTNKk-0006IT-W9
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:56:11 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTNKj-0002xD-1p
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:56:10 -0400
Received: by mail-pf1-x42a.google.com with SMTP id n23so2675812pfv.4
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=SY869irrxzfOoJkdWCuDuzh7ZngMT+9YxkjytmTDREU=;
 b=U7PowsmPYHknkV3fCw5NxMoC2azRQc+aWAttZ+UHqBZVvwM6dUlqw02Rm2h0zbAbI0
 xbGhtLJ9geYBLFjmTS/5oO5gArei8XSmN62/NNQFQA1+cUB9oZTURXW+AEEwQjYGwoGe
 hBw5BdJd2jktGxhnL3O8AKZdJ95pCO39/6x2yaNFPkm/oAj+jO6+sfeIxbSIkB6qsEtT
 mjDd6A1iOBomObypmypRTU8IV2hWlesozGv9gtU73ixhNgIUvTqibBGj62+H1g2CH6Yv
 O0Y0fl6s49RPCuLNCFEjmFme7dqAQUWsUdhWd8oioOQzNLIehSsGSIHAl7DSq+d4KCb4
 3L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=SY869irrxzfOoJkdWCuDuzh7ZngMT+9YxkjytmTDREU=;
 b=tZ9dqksCuj2bEkXyxgNrdyA2LRzlmhEdOulCB4TdK6uHUmE3s+aCuMRkYbp+8AKCKj
 RLo3zAGuwSzY5ZrNQKIovXYPrfTWWM3y9/CyCB7qKHRnLvvxiuEDhFtrNUlQ5Sp4+Shz
 zapQbAtS1ENUpRRkPk2XXRDbrfr8U9tjO3BlNJnrPWthUOUjU9ySomJFQM9ZT+yfLsvn
 SG8nUijX7ty/cfNm/H4yoaOQkA51yNDXrosPGZObjbnmv7Plcac0nVjSXXl095mc+/iF
 SAxwotiUDwDFvV630xWc8oi1HMm394XASGCj+8WO/L8PDPcBb1icf5b5EUM+pHoWJIck
 AIkA==
X-Gm-Message-State: AOAM532rl+Svm0qIBhQ1WnC3qS8dBCEAOPupD4HHg6OCg9hNB2R0xePM
 zI2Agrvq7q52ezu1PWyfIxEEtg==
X-Google-Smtp-Source: ABdhPJxN+kA2mTsQR+l1zBPEpE/rXxHeA2wclNVyce3HUXRFs9M3E7zp1eZW9twTe7ZJhuUZvRsFxQ==
X-Received: by 2002:a62:1ec5:0:b0:446:40ec:73b2 with SMTP id
 e188-20020a621ec5000000b0044640ec73b2mr4086191pfe.5.1632398165735; 
 Thu, 23 Sep 2021 04:56:05 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id 201sm5097769pfw.37.2021.09.23.04.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 04:56:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 17:25:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
In-Reply-To: <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2109231723060.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-11-damien.hedde@greensocs.com>
 <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 23 Sep 2021, Ani Sinha wrote:

>
>
> On Wed, 22 Sep 2021, Damien Hedde wrote:
>
> > Skip the sysbus device type per-machine allow-list check before the
> > MACHINE_INIT_PHASE_READY phase.
> >
> > This patch permits adding any sysbus device (it still needs to be
> > user_creatable) when using the -preconfig experimental option.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >
> > This commit is RFC. Depending on the condition to allow a device
> > to be added, it may change.
> > ---
> >  softmmu/qdev-monitor.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > index f1c9242855..73b991adda 100644
> > --- a/softmmu/qdev-monitor.c
> > +++ b/softmmu/qdev-monitor.c
> > @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
> >          return NULL;
> >      }
> >
> > -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> > -        /* sysbus devices need to be allowed by the machine */
> > +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
> > +        phase_check(MACHINE_INIT_PHASE_READY)) {
> > +        /*
> > +         * Sysbus devices need to be allowed by the machine.
> > +         * We only check that after the machine is ready in order to let
> > +         * us add any user_creatable sysbus device during machine creation.
> > +         */
> >          MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
> >          if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
> >              error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
>
> Since now you are adding the state of the machine creation in the
> valiation condition, the failure error message becomes misleading.
> Better to do this I think :
>
> if (object class is TYPE_SYS_BUS_DEVICE)
> {
>   if (!phase_check(MACHINE_INIT_PHASE_READY))
>     {
>       // error out here saying the state of the machine creation is too
> early
>     }
>
>     // do the other check on dynamic sysbus
>
> }

The other thing to consider is whether we should put the machine phaze
check at a higher level, at qdev_device_add() perhaps. One might envison
that different device types may be allowed to be added at different
stages of machine creation. So this check needs be more generalized for
the future.



