Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711C4EFDDC
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 03:53:25 +0200 (CEST)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naSxA-00060v-4j
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 21:53:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naSwL-0005J7-FN
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:52:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naSwK-0004hv-21
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648864351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTlSyIhupw+No7sC5LO/0mAf1bMmmO0CSBwXJtaak/o=;
 b=OBF/oOPfj972s8FNZsCOkMT7CMaZkz5GriaJE24hUb7Nqw3A8GKyYuW0NFpFQNOkpbSfe7
 bHZywiBcybvSMpt5CuS6808X6s8IJjWrmk4YtuV//vQyWQE+0KIPWZ41AMo2j456fsj1Yr
 lyj637qH5jyVbRGcglL+/fI95DLzDnY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-dUVZ_HnfPOGnYEFge-QkUw-1; Fri, 01 Apr 2022 21:52:30 -0400
X-MC-Unique: dUVZ_HnfPOGnYEFge-QkUw-1
Received: by mail-lf1-f71.google.com with SMTP id
 h14-20020a056512220e00b0044a1337e409so1914632lfu.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 18:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oTlSyIhupw+No7sC5LO/0mAf1bMmmO0CSBwXJtaak/o=;
 b=c0LubnCb6iRpM074/XO0QbaoaVOBm8Uwz8NCi3kB1muM9eviqSFwGI/8uFMpHKxkf6
 HZu5bkFn9YBOylx42Ez6HazYV7R6l2byIrj+mXwClv8drMiIBrLfaelZxP4GibjRAk6Z
 1D/UlFX0CivNrUTb6BQ1T3vFt7T0CX31wWXQrcYJvxQuBpSVz5L3cHlYnFPY5bRGIq64
 ZqmGlw8viX4m8aFrdXcLGtqnj6WCQdMS1lwCJI8TG8bimq+1dOXiJqC1hhk3qRU8APBP
 hiZytt3FeQ2gDWMtNCNSl2AwD1ZGZcHu09kC1MmB4QjTNPeRjZRcO53zGfwYCVqnwACz
 ztQA==
X-Gm-Message-State: AOAM532PQNSbGt/VApSJQeSvAoGs1jDU3WDqMqhTznkMMd7RVPgC5MJG
 OlDxRdmpLzmgMcBB6+1p68RoArL45z3w5hXvc1QNRw4EtsQbykqL4dcrMnkEciAieOOprfArOLC
 c0v03ou4NONCqguLjCm32muPcK0J1LFc=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr15132720ljq.300.1648864348604; 
 Fri, 01 Apr 2022 18:52:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqEF/mBln9KPCAni4fWvFoPsmYbNCpfmcn1fUgJvleWeZ8QTEbPA6fEDMhJJ/tgnZr+UjfReN31KdDqkz3yIk=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr15132711ljq.300.1648864348398; Fri, 01
 Apr 2022 18:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <32a3546f-d058-07ac-46d7-7d1becd305d2@intel.com>
 <e3feb385-b623-ac41-b721-3dd03bbb49e1@redhat.com>
 <622b7452-aa9c-fae4-e5c9-218ff995ef5d@intel.com>
In-Reply-To: <622b7452-aa9c-fae4-e5c9-218ff995ef5d@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 2 Apr 2022 09:52:17 +0800
Message-ID: <CACGkMEts7jy_dP8eTyPkcec-MAdvfP5uMqzcYVyn=0Omj9jKpw@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
To: Yi Liu <yi.l.liu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yi.y.sun@linux.intel.com, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 9:43 PM Yi Liu <yi.l.liu@intel.com> wrote:
>
>
>
> On 2022/3/29 12:54, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/3/28 =E4=B8=8B=E5=8D=884:45, Yi Liu =E5=86=99=E9=81=93:
> >>
> >>
> >> On 2022/3/21 13:54, Jason Wang wrote:
> >>> This patch introduce ECAP_PASID via "x-pasid-mode". Based on the
> >>> existing support for scalable mode, we need to implement the followin=
g
> >>> missing parts:
> >>>
> >>> 1) tag VTDAddressSpace with PASID and support IOMMU/DMA translation
> >>>     with PASID
> >>
> >> should it be tagging with bdf+pasid?
> >
> >
> > The problem is BDF is programmable by the guest. So we may end up
> > duplicated BDFs. That's why the code uses struct PCIBus.
>
> how about the devfn? will it also change?

The code has already used devfn, doesn't it?

struct vtd_as_key {
    PCIBus *bus;
    uint8_t devfn;
    uint32_t pasid;
};

Thanks

>  taggiing addressspace with
> BDF+PASID mostly suits the spec since the PASID table is per-bdf. If
> bus number may change, using PCIBus is fine.
>
> Regards,
> Yi Liu
>


