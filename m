Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A315AE93D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:17:58 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYSj-0007sh-8R
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVWxC-0001ve-TP
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVWx8-0003vr-Vv
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662464473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaLaNAmqzrqHBtj0sYs7hp3NloShZKHAAANekOkFe9Q=;
 b=b4xsQLRw5LTZn5VICSKXaoegMidaqsGicQgXWjZmKz6sv1ZlBPbh+ScxUxnjqJF34YJB5+
 va7l10g0DOVfm6XBFT+4aMGvEl3bFNE1VY1oQzaBvj5AQdot/OFt3V/BtlmbkACEpTgGXs
 CoX4AEks20HX1NbMS/K/YTbuXBXEX0o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-v5ZzbxknNcOYxSOfnTgDVA-1; Tue, 06 Sep 2022 07:41:12 -0400
X-MC-Unique: v5ZzbxknNcOYxSOfnTgDVA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m15-20020a056402430f00b00448af09b674so7412565edc.13
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 04:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iaLaNAmqzrqHBtj0sYs7hp3NloShZKHAAANekOkFe9Q=;
 b=bqNQuzDshh9bvyZJYk6YMVlnfpcoEaGfk6uuLgIjza8qhgdbmgLp1WQrTwyt7AQcd7
 xKGxF7c0bkxBYcN8a2rCgG77Cmj92co2fRBnHCFTwSn2C3xNKeWWfmZjZQaTY7ZYOwW9
 OWEWSs+uguRgdIu4SYcgMqpclH13GTJfLhmty2vDyQqSwTqlMFW35gxF8qQ69/NSO9rM
 zZgcYedmh/j3udVZnB2RKq55+Y1zGfZuz2ven7zrCe2s44ddnpVn3nReb7+lDwBntI5u
 mN0wo1jsOIF5fFSpOCX/9ixYf84RyiwIcpKtN7YYoWEWiVUgBqp8GmnBCQ5NMypDCjZS
 rMTQ==
X-Gm-Message-State: ACgBeo3tkg7DLFQbv8GsXkrYrca0v8a9sXGA3ljgYTNzYicqHEWD7HP3
 zCPS43aHg6HfucbETkN4JMeSHv9nmG1JPSEJqFCQV/DIRLCo8hpyHjQOrIWkXYl8FISkRgZi28g
 zo4ewCR3BwN3PF9lPWS8OyfosX4lmfWzYmWBhCmT0ifNidbMREwAOPoIikyqsYXY6Kv8=
X-Received: by 2002:a17:906:8479:b0:73d:da77:8fbe with SMTP id
 hx25-20020a170906847900b0073dda778fbemr36287397ejc.373.1662464470910; 
 Tue, 06 Sep 2022 04:41:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5MWjFjqJToBU6yts2e4P61Wvk4yVX+8C7gx4Cln4zrPdD0EOxziMD6zKBvMo+E1Jqj65kXQA==
X-Received: by 2002:a17:906:8479:b0:73d:da77:8fbe with SMTP id
 hx25-20020a170906847900b0073dda778fbemr36287382ejc.373.1662464470580; 
 Tue, 06 Sep 2022 04:41:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 la8-20020a170907780800b00741383c1c5bsm6487942ejc.196.2022.09.06.04.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 04:41:09 -0700 (PDT)
Date: Tue, 6 Sep 2022 13:41:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca
Subject: Re: [PATCH 00/17] acpi:pc/q35: minor PCI refactoring/cleanups
Message-ID: <20220906134108.6e8a0fb3@redhat.com>
In-Reply-To: <20220701133515.137890-1-imammedo@redhat.com>
References: <20220701133515.137890-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri,  1 Jul 2022 09:34:58 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

> Flushing out ACPI PCI cleanups that preceed conversion of
> DSDT PCI slots ennumeration to AcpiDevAmlIf interface.
> It's is mostly collection of patches thraet removes code
> duplication, we've accumulated around PCI relaterd AML
> in DSDT.

ping,
it still applies cleanly to master.

Michael can you pick it up?

> 
> git:
>    https://gitlab.com/imammedo/qemu.git x86_pci_cleanups
> 
> Igor Mammedov (17):
>   tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
>   acpi: x86: deduplicate HPET AML building
>   tests: acpi: update expected blobs after HPET move
>   tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
>   acpi: x86: refactor PDSM method to reduce nesting
>   x86: acpi: _DSM: use Package to pass parameters
>   tests: acpi: update expected blobs
>   tests: acpi: whitelist pc/q35 DSDT before switching _DSM to use ASUN
>   x86: acpi: cleanup PCI device _DSM duplication
>   tests: acpi: update expected blobs
>   tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
>   x86: pci: acpi: reorder Device's _ADR and _SUN fields
>   tests: acpi: update expected blobs
>   tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
>   x86: pci: acpi:  reorder Device's _DSM method
>   tests: acpi: update expected blobs
>   x86: pci: acpi: deduplate PCI slots creation
> 
>  hw/i386/acpi-build.c                  | 302 ++++++++++++++------------
>  tests/data/acpi/pc/DSDT               | Bin 5987 -> 6422 bytes
>  tests/data/acpi/pc/DSDT.acpierst      | Bin 5954 -> 6382 bytes
>  tests/data/acpi/pc/DSDT.acpihmat      | Bin 7312 -> 7747 bytes
>  tests/data/acpi/pc/DSDT.bridge        | Bin 8653 -> 9496 bytes
>  tests/data/acpi/pc/DSDT.cphp          | Bin 6451 -> 6886 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7641 -> 8076 bytes
>  tests/data/acpi/pc/DSDT.hpbridge      | Bin 5954 -> 6382 bytes
>  tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3069 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6059 -> 6494 bytes
>  tests/data/acpi/pc/DSDT.memhp         | Bin 7346 -> 7781 bytes
>  tests/data/acpi/pc/DSDT.nohpet        | Bin 5845 -> 6280 bytes
>  tests/data/acpi/pc/DSDT.numamem       | Bin 5993 -> 6428 bytes
>  tests/data/acpi/pc/DSDT.roothp        | Bin 6195 -> 6656 bytes
>  tests/data/acpi/q35/DSDT              | Bin 8274 -> 8320 bytes
>  tests/data/acpi/q35/DSDT.acpierst     | Bin 8291 -> 8337 bytes
>  tests/data/acpi/q35/DSDT.acpihmat     | Bin 9599 -> 9645 bytes
>  tests/data/acpi/q35/DSDT.applesmc     | Bin 8320 -> 8366 bytes
>  tests/data/acpi/q35/DSDT.bridge       | Bin 10988 -> 11449 bytes
>  tests/data/acpi/q35/DSDT.cphp         | Bin 8738 -> 8784 bytes
>  tests/data/acpi/q35/DSDT.cxl          | Bin 9600 -> 9646 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9928 -> 9974 bytes
>  tests/data/acpi/q35/DSDT.ipmibt       | Bin 8349 -> 8395 bytes
>  tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8363 -> 8409 bytes
>  tests/data/acpi/q35/DSDT.ivrs         | Bin 8291 -> 8337 bytes
>  tests/data/acpi/q35/DSDT.memhp        | Bin 9633 -> 9679 bytes
>  tests/data/acpi/q35/DSDT.mmio64       | Bin 9404 -> 9450 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge | Bin 8568 -> 8640 bytes
>  tests/data/acpi/q35/DSDT.nohpet       | Bin 8132 -> 8178 bytes
>  tests/data/acpi/q35/DSDT.numamem      | Bin 8280 -> 8326 bytes
>  tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8375 -> 8421 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8880 -> 8926 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8906 -> 8952 bytes
>  tests/data/acpi/q35/DSDT.viot         | Bin 9383 -> 9429 bytes
>  tests/data/acpi/q35/DSDT.xapic        | Bin 35637 -> 35683 bytes
>  35 files changed, 161 insertions(+), 141 deletions(-)
> 


