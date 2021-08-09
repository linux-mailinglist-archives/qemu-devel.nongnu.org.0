Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF793E4370
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:59:07 +0200 (CEST)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD23m-0007zO-Af
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD22V-0006bd-Hz
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:57:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD22T-00088S-Sg
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:57:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id e19so27874664ejs.9
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
 :content-transfer-encoding;
 bh=55dnYIYWNYblC24FugAAF/2jai5qUq48iTZgLO+Xg9Q=;
 b=V1X93RdyTfyiM+vw0MikY22yvanHfuA6oVbl6KVgRLkfXedz/j+0c1v/uH8BeaUkhV
 dhxl+GYMyXHKBIh6tJJMPWloJH+xD5QCdzwHw9TROEEt1iyx334GO2i/Hi7orleiYNPo
 oXIydoL9eefTB2cDKwPB4n8C5qKHPFGDXQkooSgSK2UHy8agt8pA6my5iq2bJikydxCs
 Lt26LQGo35RW8q8OJsZG19ukKh0IrZw+DVCq6ckpj75ejD2zezDBmMdZdSdyB6DeMKfz
 usESTmYcIfNU5wlWfek1hH63MZ+XsiGlNmkmOpuVGUUoGfmhS85nXdWCTIYbqgts0TGN
 /Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc:content-transfer-encoding;
 bh=55dnYIYWNYblC24FugAAF/2jai5qUq48iTZgLO+Xg9Q=;
 b=BrNR+blr7dhlordBhIWlvr5lJYfgWbbRRshKXpZVICX/CBlIubH85NV5iKRnot/b20
 JbWolJXhoKfJmySEN6rOd4Hlle0jQM59Js9/6XHZ3dSCbe8Zibdgmj096njdD5bwCDGk
 C3NOybEqLkr0fyMYLPl3C9ZRoCxSuDPjD7IMkPGW8bzp6H6h/WSb5PLd+tFkSSqyD/PY
 6Reu2AZpunESGVMEL9AfjIsNrReCUvp9IaS5oMpU5STRHg8shDoDN/FXa68PPGzWR2a7
 5kqVpLO/pDTo8OZocLsBj1pgO6GCgeiqo4Yr94rGuNPuk6rjX6+7gyG8CqGR1Yc5p2eP
 3FTg==
X-Gm-Message-State: AOAM533C54AGCkU7qSOPvgFXy6MzMuQFKTR0648Xr4LWPWZAY+jtsqBg
 KrjwxXAJ0ENXwOAXk2PsCWT9ZNEVE6sGMomvQLaeqg==
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mt3623540ejf.482.1628503064467; 
 Mon, 09 Aug 2021 02:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
In-Reply-To: <1436284182-5063-25-git-send-email-agraf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 10:57:00 +0100
Message-ID: <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jul 2015 at 16:49, Alexander Graf <agraf@suse.de> wrote:
>
> From: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
>
> Each hardware instance has a platform unique location code.  The OF
> device tree that describes a part of a hardware entity must include
> the =E2=80=9Cibm,loc-code=E2=80=9D property with a value that represents =
the location
> code for that hardware entity.
>
> Populate ibm,loc-code.

Ancient patch, but Coverity has just noticed a bug in it
which is still present in current QEMU (CID 1460454):

> +static char *spapr_phb_vfio_get_loc_code(sPAPRPHBState *sphb,  PCIDevice=
 *pdev)
> +{
> +    char *path =3D NULL, *buf =3D NULL, *host =3D NULL;
> +
> +    /* Get the PCI VFIO host id */
> +    host =3D object_property_get_str(OBJECT(pdev), "host", NULL);
> +    if (!host) {
> +        goto err_out;
> +    }
> +
> +    /* Construct the path of the file that will give us the DT location =
*/
> +    path =3D g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
> +    g_free(host);
> +    if (!path || !g_file_get_contents(path, &buf, NULL, NULL)) {
> +        goto err_out;
> +    }
> +    g_free(path);

Here we create a 'path' string, use it as the argument to
g_file_get_contents() and then free it (either here or in the err_out path)=
...

> +
> +    /* Construct and read from host device tree the loc-code */
> +    path =3D g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
> +    g_free(buf);
> +    if (!path || !g_file_get_contents(path, &buf, NULL, NULL)) {
> +        goto err_out;
> +    }
> +    return buf;

...but here we forget to free it before returning in the success case.

> +
> +err_out:
> +    g_free(path);
> +    return NULL;
> +}

Cleanest fix would be to declare 'path' and 'host' as
   g_autofree char *path =3D NULL;
   g_autofree char *host =3D NULL;
and then you can remove all the manual g_free(path) and g_free(host) calls.

thanks
-- PMM

