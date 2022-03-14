Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C44D8989
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:42:56 +0100 (CET)
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnmZ-0001DG-Ae
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:42:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTnlE-0007zm-B7; Mon, 14 Mar 2022 12:41:32 -0400
Received: from [2607:f8b0:4864:20::102d] (port=52123
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTnlC-00081j-J4; Mon, 14 Mar 2022 12:41:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id cx5so15274256pjb.1;
 Mon, 14 Mar 2022 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W0zrBM+N0hxFD4HvfoclDpELnmJr/18GN6q0lPZatEw=;
 b=fmpUDGOi8OZUJgMmHkU4ZiecIW8QqM1a02qsRb5yuKVzZqkKGRd0gAv5AfPJZciLC2
 wyfwXolLcpsITp6G/VgGOl4n+QuCOLQk3Yq16Z7BHeO1D5wgcSAf/IDLm72KrjEXZHV/
 M4BRhf0N2E/JnyG/RHuUFZTe+nWC8OwxMU8ozx661gpkTL/UO2ghlDIt48sBGxo0Msdh
 /YNfia3uEbrZh1oI7H2fo/d1bB9/w6wpunLJALQRD5SqFqrj8TQigLM4Ted+4sWSxOKR
 FPVMqV/tM1261P8Mf1g7qtmMopnyahbNNaai7t7ssi2iWy+HgxXH9dvrAsqdbHKia6V5
 abag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W0zrBM+N0hxFD4HvfoclDpELnmJr/18GN6q0lPZatEw=;
 b=7IDb1DN4m8RGXxLr1JY4SxVcdJ2/ocs2TAg4W09Zv3WofeUOTPlQGT8QTEFLndDQVl
 GJgQlrWDz4yDCo7VW+laIh1KBKXPOsZOpSRKlYS84eB9lV0U3Fy5JoWSoxsON6P9njgW
 ppm3fuK5uxVxzqY9mPhOg17h3kO9Au87AhqGYd5i4LjOSRMZh0rqAKcjZ67f0hsKTaQH
 uz26nvp2f+pIxQns+h2hZn/sdPErbCzKocbys/2p7CxHzApc9XA16AOa6enQ4ABtuyuj
 XUcv0qBozZ5OXhkFh+7UFJVxpxD5LVYHgwXXYi9mi3JdrcFfaoFWqGXhY56kiR45s0tY
 nlhw==
X-Gm-Message-State: AOAM53165prMXR0DOlPF/hZE85KYVS5Pm4Z0dLs1kvFlHNLLpDx78z71
 RZ3ftij5lbFHevHftiAiFOM=
X-Google-Smtp-Source: ABdhPJwPi5HHkN9qRkorFbCauI5zttPHA5P4ioPiaxV0wCn1Jl6lXBIv9n8vWOh2Ce6Vb5rH2bPC8Q==
X-Received: by 2002:a17:90a:1b4a:b0:1bf:1112:5ef with SMTP id
 q68-20020a17090a1b4a00b001bf111205efmr36323pjq.143.1647276087626; 
 Mon, 14 Mar 2022 09:41:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a056a00178100b004f731a1a952sm22043486pfg.168.2022.03.14.09.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 09:41:27 -0700 (PDT)
Message-ID: <8ac83023-3609-4b24-6ffc-9f93478ce69b@gmail.com>
Date: Mon, 14 Mar 2022 17:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 0/3] Use g_new() & friends where that makes obvious
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220314160108.1440470-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314160108.1440470-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/3/22 17:01, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This series only touches allocations with size arguments of the form
> sizeof(T).  It's mechanical, except for a tiny fix in PATCH 2.
> 
> PATCH 1 adds the Coccinelle script.
> 
> PATCH 2 cleans up the virtio-9p subsystem, and fixes a harmless typing
> error uncovered by the cleanup.
> 
> PATCH 3 cleans up everything else.  I started to split it up, but
> splitting is a lot of decisions, and I just can't see the value.
> 
> For instance, MAINTAINERS tells me to split for subsystem "virtio",
> patching
> 
>      hw/char/virtio-serial-bus.c
>      hw/display/virtio-gpu.c
>      hw/net/virtio-net.c
>      hw/virtio/virtio-crypto.c
>      hw/virtio/virtio-iommu.c
>      hw/virtio/virtio.c
> 
> But it also tells me to split for subsystem "Character devices",
> patching
> 
>      hw/char/parallel.c                       |  2 +-
>      hw/char/riscv_htif.c                     |  2 +-
>      hw/char/virtio-serial-bus.c              |  6 +-
> 
> and for subsystem "Network devices", patching
> 
>      hw/net/virtio-net.c
> 
> and for subsystem "virtio-gpu", patching
> 
>      hw/display/virtio-gpu.c
> 
> I guess I'd go with "virtio".  Six files down, 103 to go.  Thanks, but
> no thanks.
> 
> Since the transformation is local to a function call, dropping is
> completely safe.  We can deal with conflicts by dropping conflicting
> hunks, with "git-pull -s recursive -X ours".  Or drop entire files
> with conflicts.
> 
> If you want me to split off certain parts, please tell me exactly what
> you want split off, and I'll gladly do the splitting.  I don't mind
> the splitting part, I do mind the *thinking* part.
> 
> Markus Armbruster (3):
>    scripts/coccinelle: New use-g_new-etc.cocci
>    9pfs: Use g_new() & friends where that makes obvious sense
>    Use g_new() & friends where that makes obvious sense

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

