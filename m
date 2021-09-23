Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7B415C82
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 13:06:33 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMYi-0004vU-SZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 07:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMWW-00047W-7t
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:04:16 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMWU-00089r-JC
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:04:15 -0400
Received: by mail-pl1-x629.google.com with SMTP id y5so1313692pll.3
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 04:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1RxHU6ohg85S859gdTN8SmlrMapEypB3sVeaylhNzKc=;
 b=xp676m60NgY6Pdk+CpLb9v69Dv7cEYtiwmfwoFGZ7BHxLWSfF5ZC3a2ws4uSjGuOPf
 4TZzaTD+knuMaYTye3KpEj338NPh5Ff76gGjAjREmiiyTFOoTaBAbUb8MkDxQH90wkYg
 xlFeVbThhDtvCrKK+wJ+Dy+E2elCJ6oW1f75VWa0LVveVn6aP92rVU4ar8U4sIi1N2a/
 ymrDK13CEBTLq5G7O4r16iQe5Wgb97+pgZpswQaZjm2PZb6URvfdknz0qcX2ENrqjP8T
 amsF0+DqaiUPp74kE1Nku+dzo/fKWirhwT9B3cjbaPY7tNoqTusSwBX+bu8idJDfmvWd
 sJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1RxHU6ohg85S859gdTN8SmlrMapEypB3sVeaylhNzKc=;
 b=HTZEQoSiW/RhiNNbMfSIemhCXtN1nwgRnkSthKepblgrcVSMT69v25HhMaQeW+FBML
 PgxY675M1mG1umk0Ub4euSpIRAoUl2X5PZJDVIg2F2u2VRLRCDiJ/BEX/iDPjEj/ymW3
 jjVxRIt5SQSoppTC2OkwtnQ8/YaHIgWxBBQlSdIp1ng6DrlZkGDAR3lNguUCwUG9sg9Y
 i8MqQfhXa7kAnHxNmutLpqe4TCs4RhU5/3rA2+WiXED0k2negu3R0rznWi1DmYQ9H2tu
 AVm28nKO75N4s4db3he49hQjxXotAQGH7cJwNEyb85EkZ05h9QdwrjWy33vMyNL98XJ3
 9THQ==
X-Gm-Message-State: AOAM533M8wNg12EcWBMgsAQ9ktNBkXm7Wf3P4Bq3hYTZIRLcUvlpVLFs
 STVG+nR1UDxapkkA3LEc8VfOww==
X-Google-Smtp-Source: ABdhPJxBS6AGfLPmzLRaQHRFmVjDVoRSyb6vHulAN4aGINKZzpCa+OGlRLA+YQyj5ZUQtE0f9I/NeA==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr16930916pjb.55.1632395052788; 
 Thu, 23 Sep 2021 04:04:12 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id 126sm6890764pgi.86.2021.09.23.04.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 04:04:12 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 16:34:01 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
In-Reply-To: <20210922161405.140018-11-damien.hedde@greensocs.com>
Message-ID: <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-11-damien.hedde@greensocs.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x629.google.com
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
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 22 Sep 2021, Damien Hedde wrote:

> Skip the sysbus device type per-machine allow-list check before the
> MACHINE_INIT_PHASE_READY phase.
>
> This patch permits adding any sysbus device (it still needs to be
> user_creatable) when using the -preconfig experimental option.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> This commit is RFC. Depending on the condition to allow a device
> to be added, it may change.
> ---
>  softmmu/qdev-monitor.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index f1c9242855..73b991adda 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>
> -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> -        /* sysbus devices need to be allowed by the machine */
> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
> +        phase_check(MACHINE_INIT_PHASE_READY)) {
> +        /*
> +         * Sysbus devices need to be allowed by the machine.
> +         * We only check that after the machine is ready in order to let
> +         * us add any user_creatable sysbus device during machine creation.
> +         */
>          MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
>          if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
>              error_setg(errp, "'%s' is not an allowed pluggable sysbus device "

Since now you are adding the state of the machine creation in the
valiation condition, the failure error message becomes misleading.
Better to do this I think :

if (object class is TYPE_SYS_BUS_DEVICE)
{
  if (!phase_check(MACHINE_INIT_PHASE_READY))
    {
      // error out here saying the state of the machine creation is too
early
    }

    // do the other check on dynamic sysbus

}


