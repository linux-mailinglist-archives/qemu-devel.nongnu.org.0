Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F3A359506
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 07:53:52 +0200 (CEST)
Received: from localhost ([::1]:38732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUk5X-0004IP-5U
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 01:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lUk4f-0003eo-RE
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 01:52:57 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lUk4b-00080V-Fg
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 01:52:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id l1so2197642plg.12
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JqY4OzfjXdXW6eTM4SsE8qARqfe4Pjc72bJ4+RvSugM=;
 b=cR0nmzq98FLIof4hDJQixM0kVpZalixAm2F4SVSxpJsfqYh+1l1Kh3+EZRMG3HJJUD
 16T+sUaGkvDDdUvI0biAzQwcdwdIWOdOAwtpsd1GGlJSkUYw0RAYjQDkVDixNw4SzWph
 LkWx99kbCQAf9Gf4zDdhRtiY49tAAj+3kHho8GjWNYUzp9kpqsDQsSkVnv8sbyFnYw2k
 kDdmC9S7Cb0uaIN9kkc+hVKKh81tA9il/LT90Hn+xFO+ED+wQuTs+vYnPs/z8u1YQSfz
 osY2URGQy1ZfV2sgmx5mR6ZVbf9t0NIEDmhpFfiXRQXW8raPLI7whuq5583RzNIZmAUF
 nZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JqY4OzfjXdXW6eTM4SsE8qARqfe4Pjc72bJ4+RvSugM=;
 b=d6IncgLJKUypVmEFf+Rq4PKuDWd3gmd0Ktk6TP3aO4R3JxIvnTfkYo3USOH/BoZFwp
 begzKKnehY0oxXVh/UsxA+U+mWHKA7BB9BZ/nOmX4uwxE2slp6NAgq3QIgvKq4obV8Yj
 9mKKcoUbrw27o4xJHkx7v6uuKx+iAkBPj8IPR/O/eUi/8dUbEpsiEfEza2UW00IXEto2
 /uWBJ01HMhtfSwr8s/0Wr7lufguj98ZlJe825VvpXqjbiZtenDh1mjUHjrct3MDoOXMr
 em82R9mdb46IV/NHn3O787BmT4K/S70DmIJ4bKPh2MVeTmeRlT/d1kE2lm/7mY8kKcVh
 s+mg==
X-Gm-Message-State: AOAM530KHMWVUgXJAv6vniQUc0LZNLNMBxw18j7OivBbZbbKY7b8DJNc
 ClxRCyIpEdBYVAOV9NQFFl2B1+67pbs2rA==
X-Google-Smtp-Source: ABdhPJx3dnE4IfwIIbSuXN273VVX3AtzGMwq2VtzNKfegcD4BokKnPSShhgA0a/NmINjBX4CooWAwQ==
X-Received: by 2002:a17:90a:73c2:: with SMTP id
 n2mr12113470pjk.170.1617947569851; 
 Thu, 08 Apr 2021 22:52:49 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id a15sm1036753pju.34.2021.04.08.22.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 22:52:49 -0700 (PDT)
Message-ID: <c32dcd9a-cbcd-a658-de1a-f1332cdb32c5@ozlabs.ru>
Date: Fri, 9 Apr 2021 15:52:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v18] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210331025308.29387-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210331025308.29387-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/03/2021 13:53, Alexey Kardashevskiy wrote:
> The PAPR platform which describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.
> 
> Since the beginning, the runtime component of the firmware (RTAS) has
> been implemented as a 20 byte shim which simply forwards it to
> a hypercall implemented in qemu. The boot time firmware component is
> SLOF - but a build that's specific to qemu, and has always needed to be
> updated in sync with it. Even though we've managed to limit the amount
> of runtime communication we need between qemu and SLOF, there's some,
> and it has become increasingly awkward to handle as we've implemented
> new features.
> 
> This implements a boot time OF client interface (CI) which is
> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> which implements Open Firmware Client Interface (OF CI). This allows
> using a smaller stateless firmware which does not have to manage
> the device tree.
> 
> The new "vof.bin" firmware image is included with source code under
> pc-bios/. It also includes RTAS blob.
> 
> This implements a handful of CI methods just to get -kernel/-initrd
> working. In particular, this implements the device tree fetching and
> simple memory allocator - "claim" (an OF CI memory allocator) and updates
> "/memory@0/available" to report the client about available memory.
> 
> This implements changing some device tree properties which we know how
> to deal with, the rest is ignored. To allow changes, this skips
> fdt_pack() when x-vof=on as not packing the blob leaves some room for
> appending.
> 
> In absence of SLOF, this assigns phandles to device tree nodes to make
> device tree traversing work.
> 
> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
> 
> This adds basic instances support which are managed by a hash map
> ihandle -> [phandle].
> 
> Before the guest started, the used memory is:
> 0..e60 - the initial firmware
> 8000..10000 - stack
> 400000.. - kernel
> 3ea0000.. - initramdisk
> 
> This OF CI does not implement "interpret".
> 
> Unlike SLOF, this does not format uninitialized nvram. Instead, this
> includes a disk image with pre-formatted nvram.
> 
> With this basic support, this can only boot into kernel directly.
> However this is just enough for the petitboot kernel and initradmdisk to
> boot from any possible source. Note this requires reasonably recent guest
> kernel with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
> 
> The immediate benefit is much faster booting time which especially
> crucial with fully emulated early CPU bring up environments. Also this
> may come handy when/if GRUB-in-the-userspace sees light of the day.
> 
> This separates VOF and sPAPR in a hope that VOF bits may be reused by
> other POWERPC boards which do not support pSeries.
> 
> This is coded in assumption that later on we might be adding support for
> booting from QEMU backends (blockdev is the first candidate) without
> devices/drivers in between as OF1275 does not require that and
> it is quite easy to so.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

[...]

> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> new file mode 100644
> index 000000000000..9d22e230e3c0
> --- /dev/null
> +++ b/hw/ppc/spapr_vof.c

[...]

> +
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
> +{
> +    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
> +
> +    vof_build_dt(fdt, spapr->vof);
> +
> +    /*
> +     * SLOF-less setup requires an open instance of stdout for early
> +     * kernel printk. By now all phandles are settled so we can open
> +     * the default serial console.
> +     */
> +    if (stdout_path) {
> +        _FDT(vof_client_open_store(fdt, spapr->vof, "/chosen", "stdout",
> +                                   stdout_path));
> +    }
> +}
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr, Error **errp)
> +{
> +    Vof *vof = spapr->vof;
> +
> +    vof_init(vof, spapr->rma_size);
> +
> +    if (vof_claim(vof, 0, spapr->fw_size, 0) == -1) {
> +        error_setg(errp, "Memory for firmware is in use");
> +        return;
> +    }
> +
> +    *stack_ptr = vof_claim(vof, 0, OF_STACK_SIZE, OF_STACK_SIZE);
> +    if (*stack_ptr == -1) {
> +        error_setg(errp, "Memory allocation for stack failed");
> +        return;
> +    }
> +    /* Stack grows downwards plus reserve space for the minimum stack frame */
> +    *stack_ptr += OF_STACK_SIZE - 0x20;
> +
> +    if (spapr->kernel_size &&
> +        vof_claim(vof, spapr->kernel_addr, spapr->kernel_size, 0) == -1) {
> +        error_setg(errp, "Memory for kernel is in use");
> +        return;
> +    }
> +
> +    if (spapr->initrd_size &&
> +        vof_claim(vof, spapr->initrd_base, spapr->initrd_size, 0) == -1) {
> +        error_setg(errp, "Memory for initramdisk is in use");
> +        return;
> +    }
> +
> +    spapr_vof_client_dt_finalize(spapr, fdt);
> +
> +    /*
> +     * We skip writing FDT as nothing expects it; OF client interface is
> +     * going to be used for reading the device tree.
> +     */
> +}


This is missing "bootargs" from below.


> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> new file mode 100644
> index 000000000000..57d140b6ff33
> --- /dev/null
> +++ b/hw/ppc/vof.c

[...]

> +static uint32_t vof_setprop(void *fdt, Vof *vof,
> +                            uint32_t nodeph, uint32_t pname,
> +                            uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret = -1;
> +    int offset;
> +    char trval[64] = "";
> +    char nodepath[VOF_MAX_PATH] = "";
> +    g_autofree char *data = NULL;
> +
> +    if (vallen > VOF_MAX_PROPLEN) {
> +        goto trace_exit;
> +    }
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        goto trace_exit;
> +    }
> +    offset = fdt_node_offset_by_phandle(fdt, nodeph);
> +    if (offset < 0) {
> +        goto trace_exit;
> +    }
> +    ret = get_path(fdt, offset, nodepath, sizeof(nodepath));
> +    if (ret <= 0) {
> +        goto trace_exit;
> +    }
> +
> +    ret = -1;
> +    /*
> +     * We only allow changing properties which we know how to update in QEMU
> +     * OR
> +     * the ones which we know that they need to survive during "quiesce".
> +     */
> +    if (strcmp(nodepath, "/rtas") == 0) {
> +        if (strcmp(propname, "linux,rtas-base") == 0 ||
> +             strcmp(propname, "linux,rtas-entry") == 0) {
> +            /* These need to survive quiesce so let them store in the FDT */
> +        } else {
> +            goto trace_exit;
> +        }
> +    } else if (strcmp(nodepath, "/chosen") == 0) {
> +        if (strcmp(propname, "bootargs") == 0) {
> +            char val[1024];
> +
> +            if (readstr(valaddr, val, sizeof(val))) {
> +                goto trace_exit;
> +            }
> +            g_free(vof->bootargs);
> +            vof->bootargs = g_strdup(val);
> +            vallen = strlen(vof->bootargs) + 1;



... ^^^ this one. Otherwise "-append" is lost after "quiescence", or 
bootargs from grub.conf (if the blockdev patch applied).


So, David, if you feel ok to put this in ppc-for-6.1, then let me know, 
I'll repost with whatever fixes I may have by then. Thanks,



-- 
Alexey

