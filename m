Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B179480CB8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:14:40 +0100 (CET)
Received: from localhost ([::1]:43306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Hvi-0007PB-Mr
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:14:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2HsN-0005t3-Um
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2HsK-0000lb-N6
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640718666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9I1Amofechxki9WHdeQ4xtp2FIm6TRVUd5ZRcr2BUKM=;
 b=eohkNrsQ3AwD9DGXmxVjOQMz9MYMVE9kTR+wCmZDOL0vOcuLACqxWs7bpI+R720jpKPvH+
 WnaJzNnDbrt9LIVY49NUAayDNT3UbhFSsCwmBbhcvoRuuj/14Nyo7EEDni0vKBKaQEIPar
 nZCc1eHYUImnQLRAXNGvkIYeYwgmn5Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-tdeBZm6MNx2-gqynLPLBeQ-1; Tue, 28 Dec 2021 14:11:05 -0500
X-MC-Unique: tdeBZm6MNx2-gqynLPLBeQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so9332005wma.2
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 11:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9I1Amofechxki9WHdeQ4xtp2FIm6TRVUd5ZRcr2BUKM=;
 b=jdRtZQndP5i4F+SGVwwBJpyGSlgZPoJgBZAM9Frb/IYy4iqWgBnlWLegwa3BTqrJf7
 JF3WVlpwDKDgQF9lVa2Zto3jPeMj5LxxWccRDNZMcpUsQeaBsu9E3odlZ6hcLFKFVsuD
 +Sp/khFCQwbNF8seMBahoi2IrDS8TybNr/yq2TvPybe+sIBXJ2YXCCv60Sb37kk0Yydu
 ZFKzrXfkz5QQLZPnetEOLjrN5O9Yr76i2ZKUVoMgRePpfjR3OuU2lR8JLAxah4UiPAAH
 8r69gO2tLsdBjYun6becbRYsDIGLSPVlsW08+xFphaiINvqYx0dQhJelkV+eYs98yZOy
 r8zA==
X-Gm-Message-State: AOAM530TfyxDojXdw88BkHA5LQy/BOwL7Z/qIYNtLKnAPqfr6D15CdFZ
 sY4fpEDBLRCBjT+xfSZ2JUbSAvzaP5oNkn40NaYr+qNwGR5i0KySOPXdB8juIG9mYRmydmu6yGC
 ntEytekB/Vzyj3Fk=
X-Received: by 2002:a05:600c:8a7:: with SMTP id
 l39mr19061847wmp.138.1640718664048; 
 Tue, 28 Dec 2021 11:11:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMX5vxM1RwKHvbiOVMcDV6R1NiHbRhyh+u3z7byZ0G1HM/wG/WCO7sanH4SyoF0QXds5D9jw==
X-Received: by 2002:a05:600c:8a7:: with SMTP id
 l39mr19061815wmp.138.1640718663797; 
 Tue, 28 Dec 2021 11:11:03 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id o38sm17641759wms.11.2021.12.28.11.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:11:03 -0800 (PST)
Message-ID: <2e89a7a4-c0bd-3696-cf67-bb3f0c882d82@redhat.com>
Date: Tue, 28 Dec 2021 20:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 01/14] qemu-options: Improve readability of SMP related
 Docs
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-2-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 10:22, Yanan Wang wrote:
> We have a description in qemu-options.hx for each CPU topology
> parameter to explain what it exactly means, and also an extra
> declaration for the target-specific one, e.g. "for PC only"
> when describing "dies", and "for PC, it's on one die" when
> describing "cores".
> 
> Now we are going to introduce one more non-generic parameter
> "clusters", it will make the Doc less readable and  if we still
> continue to use the legacy way to describe it.
> 
> So let's at first make two tweaks of the Docs to improve the
> readability and also scalability:
> 1) In the -help text: Delete the extra specific declaration and
>    describe each topology parameter level by level. Then add a
>    note to declare that different machines may support different
>    subsets and the actual meaning of the supported parameters
>    will vary accordingly.
> 2) In the rST text: List all the sub-hierarchies currently
>    supported in QEMU, and correspondingly give an example of
>    -smp configuration for each of them.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  qemu-options.hx | 76 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 59 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


