Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06252623A18
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 03:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osxiy-0003Za-4Y; Wed, 09 Nov 2022 21:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osxiv-0003ZP-Eh
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 21:55:25 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1osxis-0000hh-S5
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 21:55:24 -0500
Received: by mail-il1-x136.google.com with SMTP id o13so410336ilc.7
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 18:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b0JSzVRe7rgiOmOg0Zi86JK88J5t4tp+Ly3+dI4Dqrg=;
 b=r0G/oN4Dvquu1sfWpF6dcBZ6SbYfQzNyUBR3J/FhjOjYe5rO475v6RnaUVANyG7TrK
 Z1sHK4T5bn8/Uxidtg0iqPj1IiKVnAAN/Vj1AA09qJp1kUprHFH50X7vUTxWNT1p1zmG
 dRubVWLA4MAWSuBdaPhF/laLZIN6DOS8bL08Zf1GU4aby3BOtMDw+4lglpHeNklGisJ9
 YRE1TJhAGvwYzorFGFgUD0OIG7XD1PMJDeBb9hv4hSqmunkYHXUmYTp4FydRDEYrx06Z
 4GV8v903ROq2eEfdcxcYB9TouvpIfCX9U+lmRF2/46ZPfkCuOPjFQ5vnDqK2aZ+lxl9x
 5lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0JSzVRe7rgiOmOg0Zi86JK88J5t4tp+Ly3+dI4Dqrg=;
 b=MQLe3fNSC3vNYKORjwjdzXqHQULnPZtAHsKOOo5cCv2aDhjjOTlzzJfGu29a5ys0cP
 wOfJ2pqRC9sGvGzlhflnnJUyV+p3ushksXBhoDJ+WPevWX0vKOk3OzMzFeHtTBQvjYNw
 XZisDoiCe0YldutFwzndMksYjcskKKkFkEDvAybrdDg914H1HJ7eWbK4ZcEwiMUnfa3H
 QZpN03efGMgFxmyjPGTpsNaupl51x3ccTwQmIOhtCNHT1Tz4GjNWAMEdRomVilTk26U5
 WgPsEaDITTJh6YDMjkG33x5ZdrHBYznFjLDPrFcjEynQ5ajPBBhXqecaJhH+vK4bpwY0
 c9FQ==
X-Gm-Message-State: ACrzQf0d8Tjg/sizkDT2XkdRHlPDs6Fo8AzXj/TPrPYu5vYB6TveJUfn
 yvc4sfA3Ubvt9cZuJWeNzCbGCXSJWgy6u/CixItICw==
X-Google-Smtp-Source: AMsMyM7MHbhWKkiOdiqXFsOZ3J/5YQJq9sJ6HFRftTTEZWGOoqvLGdIfXQkQ9d1abdO39dg6hhqg2GtfW0KogzsY7/c=
X-Received: by 2002:a05:6e02:b2d:b0:2fb:43d:2276 with SMTP id
 e13-20020a056e020b2d00b002fb043d2276mr2452363ilu.202.1668048921132; Wed, 09
 Nov 2022 18:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-45-mst@redhat.com>
 <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
In-Reply-To: <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 10 Nov 2022 08:25:10 +0530
Message-ID: <CAARzgwxd_uaU5wb3M27Yhj-a3SwJ8=+cSJm2RNXA7XH+-ZwRQg@mail.gmail.com>
Subject: Re: [PULL v4 44/83] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
To: Laurent Vivier <lvivier@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>, 
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 9, 2022 at 11:09 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> This one breaks something for me:
>
> [3/65] Compiling C object libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o
> FAILED: libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o
> clang -m64 -mcx16 -Ilibhw-display-virtio-vga-gl.a.p -I. -I../../../Projects/qemu-upstream
> -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include
> -I/usr/include/sysprof-4 -fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
> -isystem /home/lvivier/Projects/qemu-upstream/linux-headers -isystem linux-headers -iquote
> . -iquote /home/lvivier/Projects/qemu-upstream -iquote
> /home/lvivier/Projects/qemu-upstream/include -iquote
> /home/lvivier/Projects/qemu-upstream/tcg/i386 -pthread -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negative-value
> -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-type-limit-compare
> -Wno-psabi -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
> -fsanitize=address -fPIC -DBUILD_DSO -MD -MQ
> libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o -MF
> libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o.d -o
> libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o -c
> ../../../Projects/qemu-upstream/hw/display/acpi-vga.c
> In file included from ../../../Projects/qemu-upstream/hw/display/acpi-vga.c:4:
> In file included from ../../../Projects/qemu-upstream/hw/display/vga_int.h:30:
> In file included from /home/lvivier/Projects/qemu-upstream/include/ui/console.h:4:
> /home/lvivier/Projects/qemu-upstream/include/ui/qemu-pixman.h:12:10: fatal error:
> 'pixman.h' file not found
> #include <pixman.h>
>           ^~~~~~~~~~
> 1 error generated.
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:165: run-ninja] Error 1
> make: Leaving directory '/home/lvivier/Objects/qemu-upstream/x86_64'
>
> Any idea?

For the records, we are also seeing this in the custom-runners in the
CI pipeline.

