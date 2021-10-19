Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C31B433372
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:25:00 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmIl-0007qB-Lw
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmHd-0006wc-T1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmHc-0007g8-9w
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634639027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a2LU/B2lCzgm5oVTbpfgPG+hxYplWlo1q5efZ+Xo8uY=;
 b=ZKl1gU4Jh0YIlEaHZtlVprbfaLP2DBnAHNq7nuyxEu0hw7YfL1jjaTgPWq1N4ZF2VEKQIi
 uN446AnQDL8xzuTLCcxkE0iClOJyjuIdMIkvAL12JdLoG6O+EH03u33FuJS/3IA7+3Dhqz
 bCN2PZPG0lNcwX80jaKz6RfPWsI1HnI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-GYVGhNEtPCa76cKQy6U3oQ-1; Tue, 19 Oct 2021 06:23:46 -0400
X-MC-Unique: GYVGhNEtPCa76cKQy6U3oQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so977176wmg.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a2LU/B2lCzgm5oVTbpfgPG+hxYplWlo1q5efZ+Xo8uY=;
 b=VVc6d3QHVKlK9rc0U9m4W9AXXthNXxNylvXzPYFB+0Ochz+dLIfwrWPORaoZBHzQBi
 mX8D+GjrgbHtcHCxGIyQzcp1bGKi3Re3M1pTrD6ZGdefBseqYFQoxSVEXfFhs1ovTMtC
 58bXz+YyDe98PTLJzq0GLpxn+p9d+iqn/ics8WIXJP8d9gCdfAaqytJTu0Bs9Kq1H8j4
 23ZbEIZRyK9JrXsrk7K3eUBuKjnQAp9OT1k0Y+UhlOaYU/pv+y4yLXGq2A2MtNiRVXCp
 Zmz8o8shh8GyDFyIwo8JNMuVBtIZKEeVIZiHLIzG/Sc0gGrM88OFxkHVbPYl4vdY6d1j
 01Vw==
X-Gm-Message-State: AOAM533pwRWeUHYVFlnNyYzvtpybdJU8Nue7S+798z+Mr6m91/U7v6Ol
 VEngfUYhwVWwJaSScCBwLQLaeNfU2T8YggmcB2u3djVwnPOeRT/PftR0bMsWIZfxZ3hqFmE23Dp
 vYcg7vMPK5dHDGGo=
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr4955074wml.68.1634639025543; 
 Tue, 19 Oct 2021 03:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV+GEuksb2vaKUMIFmz0ag8CSButC7it+k2pKbsWRpqwgqzbHNoKBD5m2JiqJC3bGTeANnrw==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr4955045wml.68.1634639025253; 
 Tue, 19 Oct 2021 03:23:45 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id k17sm14464817wrc.93.2021.10.19.03.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:23:43 -0700 (PDT)
Date: Tue, 19 Oct 2021 06:23:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 04/15] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211019061656-mutt-send-email-mst@kernel.org>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-5-imammedo@redhat.com>
 <20211018173052-mutt-send-email-mst@kernel.org>
 <20211019114825.1464da19@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019114825.1464da19@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:48:25AM +0200, Igor Mammedov wrote:
> On Mon, 18 Oct 2021 17:31:33 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Sep 02, 2021 at 07:35:40AM -0400, Igor Mammedov wrote:
> > > Set -smp 1,maxcpus=288 to test for ACPI code that
> > > deal with CPUs with large APIC ID (>255).
> > > 
> > > PS:
> > > Test requires KVM and in-kernel irqchip support,
> > > so skip test if KVM is not available.
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > > v3:
> > >   - add dedicated test instead of abusing 'numamem' one
> > >   - add 'kvm' prefix to the test name
> > >       ("Michael S. Tsirkin" <mst@redhat.com>)
> > > v2:
> > >   - switch to qtest_has_accel() API
> > > 
> > > CC: thuth@redhat.com
> > > CC: lvivier@redhat.com
> > > ---
> > >  tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index 51d3a4e239..1f6779da87 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
> > >      free_test_data(&data);
> > >  }
> > >  
> > > +static void test_acpi_q35_kvm_xapic(void)
> > > +{
> > > +    test_data data;
> > > +
> > > +    memset(&data, 0, sizeof(data));
> > > +    data.machine = MACHINE_Q35;
> > > +    data.variant = ".xapic";
> > > +    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> > > +                  " -numa node -numa node,memdev=ram0"
> > > +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
> > > +    free_test_data(&data);
> > > +}
> > > +
> > >  static void test_acpi_q35_tcg_nosmm(void)
> > >  {
> > >      test_data data;  
> > 
> > 
> > This causes an annoying message each time I run it:
> > 
> > qemu-system-x86_64: -accel kvm: warning: Number of hotpluggable cpus requested (288) exceeds the recommended cpus supported by KVM (240)
> > 
> > what gives?
> 
> it depends on kernel, see kvm_recommended_vcpus().
> 
> We probably should bump it on upstream kernel side
> (it's much more than that in RHEL8).
> 
> Is there anything that prevents bumping upstream kernel limits?

what should we do with the annoying warning though?


> > > @@ -1506,6 +1519,7 @@ static void test_acpi_oem_fields_virt(void)
> > >  int main(int argc, char *argv[])
> > >  {
> > >      const char *arch = qtest_get_arch();
> > > +    const bool has_kvm = qtest_has_accel("kvm");
> > >      int ret;
> > >  
> > >      g_test_init(&argc, &argv, NULL);
> > > @@ -1561,6 +1575,9 @@ int main(int argc, char *argv[])
> > >          if (strcmp(arch, "x86_64") == 0) {
> > >              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> > >          }
> > > +        if (has_kvm) {
> > > +            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
> > > +        }
> > >      } else if (strcmp(arch, "aarch64") == 0) {
> > >          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> > >          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> > > -- 
> > > 2.27.0  
> > 


