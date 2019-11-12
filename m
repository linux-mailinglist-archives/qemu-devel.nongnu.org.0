Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7CF8CA4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 11:19:25 +0100 (CET)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUTGe-0007F5-7p
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 05:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iUTFe-0006SV-7Z
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:18:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iUTFd-00031c-3p
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:18:22 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:47055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iUTFc-00031E-U2
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:18:21 -0500
Received: by mail-oi1-x242.google.com with SMTP id n14so14252681oie.13
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 02:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hamS2hHpsd6z1GL6vZMYl9y8NR9Px3Ov7NkV6Cym3Xg=;
 b=YYmLWh2MODfbGV3fa6HCLCIVQ/tIfUUTSBVJkaGweP8kENDOXSXHolNXYxmk36AcxY
 NEsBb2xs0/YQ1Zmjr3MgLV6vLdYOhva4G+eGVqjccEsafaFGgiDgZ84NPE400MhOChYm
 0TJqrrxtKaGC4abfO4JFYurvjH93PlFNHEf/h6kty7nArNyfELQD+vVsz/6v4elWA6ak
 7FjPLk2GRESScD4ty80aPx57bjPWFscbqguBzmUS4URxHXC+fWUNyyABmAP2PV9qGrrG
 v8rug2wXbdmolwKW65dgDApmRStGTy571ryv+08QsHPflluhN5f1ZtX66L/O50VEaDqw
 aVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hamS2hHpsd6z1GL6vZMYl9y8NR9Px3Ov7NkV6Cym3Xg=;
 b=tOsWRgGqAOsRHCZD2zmnLvx8UqKP5Mg7apw7FlpvNSEi5hWHuvK5EoQ/90w3UKYeN0
 rN5cQs5hgRG6T4CxMlqFFAmzDcgATfZQG++jhFitQyc9eusoCfcfABIgabGbNo2QDN3q
 vS/Oj+ifTo5A3JG1dkxlHojqvCdWxz3qF+KWh09KSTsvD+EyC7uU/zE3oc7YWhPYWEkd
 +BQATYP7jGe1Q5wI9P1FjqIpN/zMjZmqBJHzogpeL6no9I04nS9THC4F95PCfn0rjRHe
 SDxpfIgITPQCwCBaB+ha8htC8gzrGoYm0CZCWkRBSdJGHZSL+CMrNVBh7Pfzs8cJifyD
 vMZQ==
X-Gm-Message-State: APjAAAVcHsoSzFWRn3T+FgVRU5kHsTvkNiiFmiAorEd/NMDkAwqJ/DpB
 gM1bSNLPkYscbl/CExDlW/OlzlyLvC8Dv133wy5Eig==
X-Google-Smtp-Source: APXvYqw1WbrUeAvIKG06Fui7nW9VdYWr7cg+Ebk+8N899gfWmWiPV3H+ihuZWW803BddcAMh4gqI3ttHlRg/C+mq/2A=
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr3222557oia.146.1573553900111; 
 Tue, 12 Nov 2019 02:18:20 -0800 (PST)
MIME-Version: 1.0
References: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
 <1571925835-31930-21-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1571925835-31930-21-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Nov 2019 10:18:09 +0000
Message-ID: <CAFEAcA-wqep+Lq93Ps=d6Cgx9bbYSNCcankbdvzoGz5T2P1_YA@mail.gmail.com>
Subject: Re: [PULL 20/39] hw/i386: Introduce the microvm machine type
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Oct 2019 at 16:19, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Sergio Lopez <slp@redhat.com>
>
> microvm is a machine type inspired by Firecracker and constructed
> after its machine model.
>
> It's a minimalist machine type without PCI nor ACPI support, designed
> for short-lived guests. microvm also establishes a baseline for
> benchmarking and optimizing both QEMU and guest operating systems,
> since it is optimized for both boot time and footprint.

Hi; Coverity points out a memory leak in this commit
(CID 1407218):


> +static void microvm_fix_kernel_cmdline(MachineState *machine)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(machine);
> +    BusState *bus;
> +    BusChild *kid;
> +    char *cmdline;
> +
> +    /*
> +     * Find MMIO transports with attached devices, and add them to the kernel
> +     * command line.
> +     *
> +     * Yes, this is a hack, but one that heavily improves the UX without
> +     * introducing any significant issues.
> +     */
> +    cmdline = g_strdup(machine->kernel_cmdline);

Here we allocate memory for cmdline...

> +    bus = sysbus_get_default();
> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> +        DeviceState *dev = kid->child;
> +        ObjectClass *class = object_get_class(OBJECT(dev));
> +
> +        if (class == object_class_by_name(TYPE_VIRTIO_MMIO)) {
> +            VirtIOMMIOProxy *mmio = VIRTIO_MMIO(OBJECT(dev));
> +            VirtioBusState *mmio_virtio_bus = &mmio->bus;
> +            BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
> +
> +            if (!QTAILQ_EMPTY(&mmio_bus->children)) {
> +                gchar *mmio_cmdline = microvm_get_mmio_cmdline(mmio_bus->name);
> +                if (mmio_cmdline) {
> +                    char *newcmd = g_strjoin(NULL, cmdline, mmio_cmdline, NULL);
> +                    g_free(mmio_cmdline);
> +                    g_free(cmdline);
> +                    cmdline = newcmd;
> +                }
> +            }
> +        }
> +    }
> +
> +    fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(cmdline) + 1);
> +    fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);

...but fw_cfg_modify_string() takes a copy of the string it's passed,
so we still have ownership of 'cmdline' and need to free it here
to avoid a leak.

> +}

thanks
-- PMM

