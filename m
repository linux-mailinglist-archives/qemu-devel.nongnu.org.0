Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D3743AF78
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:51:08 +0200 (CEST)
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJ6p-0006Vz-5u
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfJ3Q-0003u1-9A
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:47:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfJ3O-0007VU-CC
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:47:35 -0400
Received: by mail-wr1-x435.google.com with SMTP id m22so14744715wrb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5V25Yb/oMUvpVDl1njjnJ88gHdme+bfzB6xAExqJroI=;
 b=YO1ByWZNcynrTHf2Z7QTnoVxMedatyO9dgBOPlgw5/w4e42w2p2abEAIcHhrWciY7o
 yw3C0/RHSH7LjvQSkOtGyERjLVehItV/qtyTgZe2DIKrEkgSNHXo+YcIOAQda+/6hU3B
 fxbGkOVhzKbT1bYT395MRR1uzMPde37YiWiZGk8MT9ZQE5ZTkJaenXsQHdO8CKXi+uG1
 dd4AnvX77/tYc5pa0r/YgGOu6299FkWiYar03BhqtTCOQ4+tiQ2lFiOIUNjZM5ewLVP1
 7gGLAlEH+1feaSB6lhSkrRxShlR1EvYIp4/7qKbTkcdIpTmNOdDSPRjQ8PLJYyVGaSFI
 l3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5V25Yb/oMUvpVDl1njjnJ88gHdme+bfzB6xAExqJroI=;
 b=Ambm6i9CJwz2anmQs7dCQdnEUNFCvZyzrGoQdUF//WMicKrYPYkoKboC5dzQvAz1Yu
 AWiq7QO3Musq1J9owd2m8Tsz3Iao3+zvSxWb8FnamT1bCAxDgtRW/rfwS9LZUlVtlF+F
 tPcxjHp1ikulOtlU2Fk/8BcdkxrXOpO1TlRMjbXyRhhaFL1cTX+yw7d1mVlrBupn9cFd
 EFRonHPZ2fwsuyY7ToxE9N3vL5YqwKbZz7ImsEDahx9KgA1ynWuz1VILkDElRiRFSC4A
 ZpPHeHlGLXI6grq0UkJ5ndl7mzJoJOZARgsB+Zm0OQgYD6ZeF+lJVkyfB4m5gJS6yJZl
 dqlQ==
X-Gm-Message-State: AOAM530n8UgdWf3sQ14ddvuRTlA8lezhxVYpASl/63EKO9gLI8AsS8eG
 s7rXNu6Uw4g+d2oNQNU/fmiHTg==
X-Google-Smtp-Source: ABdhPJwe+5h/x07rhLDd/8h6ixXJBUj9GprhuO6eKYeb+auIz6iXlTbA8g9Vx4dgi9uEvLcwVo9OjA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr17835270wrd.178.1635241652704; 
 Tue, 26 Oct 2021 02:47:32 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f17sm14065284wrr.56.2021.10.26.02.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:32 -0700 (PDT)
Date: Tue, 26 Oct 2021 10:47:11 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v5 10/12] tests/acpi: add test cases for VIOT
Message-ID: <YXfOn5AcPRsCrMXC@myrica>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-11-jean-philippe@linaro.org>
 <c7dda57e-b154-1b69-1480-c89b4ba0db2e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7dda57e-b154-1b69-1480-c89b4ba0db2e@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 11:02:27AM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> > Add two test cases for VIOT, one on the q35 machine and the other on
> > virt. To test complex topologies the q35 test has two PCIe buses that
> > bypass the IOMMU (and are therefore not described by VIOT), and two
> > buses that are translated by virtio-iommu.
> >
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 4f11d03055..599b155201 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
> >      free_test_data(&data);
> >  }
> >  
> > +static void test_acpi_q35_viot(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".viot",
> > +    };
> > +
> > +    /*
> > +     * To keep things interesting, two buses bypass the IOMMU.
> > +     * VIOT should only describes the other two buses.
> > +     */
> > +    test_acpi_one("-machine default_bus_bypass_iommu=on "
> Just a reminder that we still have a dependency on the
> default_bus_bypass_iommu fix here. Otherwise those tests will fail. So
> the fix needs to be upstreamed along with that series.

Thanks for the reminder, the fix is now queued (for x86, which this patch
relies on) so should be good to go. I'm planning to fix the conflict you
reported and resend only the x86 parts, so they get be merged this cycle

Thanks,
Jean


