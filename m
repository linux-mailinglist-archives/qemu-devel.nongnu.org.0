Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACCD412712
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 21:59:43 +0200 (CEST)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPS1-0000by-VN
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 15:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPQK-00067V-7H
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:57:56 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:47625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPQI-0007R4-Bh
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:57:55 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N64FC-1mun9c1ep6-016OBF; Mon, 20 Sep 2021 21:57:52 +0200
Subject: Re: [PATCH v4 06/20] nubus: implement BusClass get_dev_path()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <31e5e219-acd4-f7f0-5484-0b6540e46596@vivier.eu>
Date: Mon, 20 Sep 2021 21:57:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QHcArG88Zk8cKD1jnkuBIQSpxpvQv1/iyizcRSKmRTjpGEeRZSd
 06yMEJlWLfURg8SQbYVQVYYDfGN1IIBScc0NbULBlrVj5molJu++HwaAM+LGFrKqCP0pKzP
 5WVM06298y6FViDjHGDSrUFRjmWuqcXlBGR9pi1zdG4MfIDumLeS4E4PphMHE4Q6l3uKzSd
 vesMKvbUpdOuMWIcVNt0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1cGk1cXOd4s=:CICL3dl/spIZ7lIv4YcJVJ
 KR/Il401oswTbFBxo7nWoTGxvzbMd8sJnnyS91ig2pY1kHhnDHSanRMhW97wZGEvmuR/oGAUP
 1TnjOGiHkDwnjVGn6MTi6Nz9pr/5q3ywWe60dx7jSCpQnidEhmlc5V1fFKCx553C4WxofBb8l
 MlmLjHbt980W8iEIXuRPHx38h12t0INy9pG5B/HA6jY9bdKUEXklNjme4Eowfe3MXL5nFZrbj
 JphdyE/yGXP/KmQbROzIrBiL7Yy9pHQZTuCQNeF2Tk5v3qbJv9JaP0tMgO0kP8CEW9NL7i78S
 Y/e5cUeKGHHz/dU0VlVTJfb8waGBrtln09Khk2l1kr4YIu+waf/7gAloUiUffToY7zr1NlGXn
 B+23dlOmzkgQAh6mEL9Fyjg69OD77AuaSZAlPlT6UnWuAcFYxQel6+9RznU8CDcOBWI9KrDbn
 u4O7dJiqm7TxyrOYtV2DTlItc7cKCSCM1bkyvxqoMUH3JOJP6A17jnNsqngaU/woQOGDZ703n
 rzXSfIW8PV9NikxM6d2mOlFbdbEkRRC10q6Glom7k2yqbTZpBZcvq7bQ0wo7YtqdFapr7NLrG
 vWp0UVbpq/8GTjV5kNHiZvT6tKWRYao7cFLSaJtee5adMtZzIDncoFkghxcHmbBJn/+xdC8wz
 7NrM4tkh9jPHnCBSW0ekf/vBMrZzAg+3QvgF8kmJyUQQWMqiL5rDF14JZsQBsBEMw+DZJ4NFU
 5Z1Osv4TfprBx4DuabuxfigVa2nr9dWGXFQEyA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/nubus-bus.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 141876b579..63e7d66b95 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -87,6 +87,21 @@ static void nubus_init(Object *obj)
>      nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);
>  }
>  
> +static char *nubus_get_dev_path(DeviceState *dev)
> +{
> +    NubusDevice *nd = NUBUS_DEVICE(dev);
> +    BusState *bus = qdev_get_parent_bus(dev);
> +    char *p = qdev_get_dev_path(bus->parent);
> +
> +    if (p) {
> +        char *ret = g_strdup_printf("%s/%s/%02x", p, bus->name, nd->slot);
> +        g_free(p);
> +        return ret;
> +    } else {
> +        return g_strdup_printf("%s/%02x", bus->name, nd->slot);
> +    }
> +}
> +
>  static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
>  {
>      NubusDevice *nd = NUBUS_DEVICE(dev);
> @@ -129,6 +144,7 @@ static void nubus_class_init(ObjectClass *oc, void *data)
>  
>      bc->realize = nubus_realize;
>      bc->check_address = nubus_check_address;
> +    bc->get_dev_path = nubus_get_dev_path;
>  }
>  
>  static const TypeInfo nubus_bus_info = {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

