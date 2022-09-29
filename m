Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835865EF8EF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:33:50 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvXo-0003ct-Px
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odtPK-0004G8-AS
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odtPH-0001nI-FG
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664457410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUixK7iSOWY7PZIXZ+ZaYv5P682/FMi+bq784o9+HQ0=;
 b=UVfkRNNfwr6INWngGwTJ0fn7+u5HdzWALhu1YFmoUZLStfmFWQ9/B6CS8B50JD7N8uLcvY
 tHKMx8Q3qc6LC/muMTKkLMoPcLBNB7ypv/rPPs1KP0Rk1q+2H2B2XYpQ+L0PunIBx1wGOE
 Kjo5v833rMfoVBxqhcUsM79/YV2Dcfo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-EykxkUWwPWaDJFzQctDTrQ-1; Thu, 29 Sep 2022 09:16:49 -0400
X-MC-Unique: EykxkUWwPWaDJFzQctDTrQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 y15-20020a1c4b0f000000b003b47578405aso418498wma.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 06:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xUixK7iSOWY7PZIXZ+ZaYv5P682/FMi+bq784o9+HQ0=;
 b=PRoNMBB0EFbvzi4n7rxs0cJKQPskm7td18d/U8QoJy/gq1+cdJ+HX+DIA0HLEarv8X
 jMlTj3144ZbWeOpB7q9qf6oUJzlbHULFEb9WpZouhEQk3yYzxSfaQZxoz6KY3nCtQ86Q
 rtv9LdFBbrpONTvyWkLV3uPhzSF4vhWHsU12jiH4q2XqcNq3VUO7vRIAbviOXvilphqK
 vzWJPcOf9i/FmQ5Bu92TBxinGGJzkW09s9CTTuaoLeSRIj0ganuBvabE/H7+w8t/0LZh
 tOhmLnIV2d96nXyi488RG60tlnk58aCsXPHdmfbTYD9qhloTegkJwdmfrAkl2rjwPbjK
 kd2g==
X-Gm-Message-State: ACrzQf3RQyv2bXBBhnWRIXaud5dPSX0bOuDmW9sYhBkzrqhi9Lcu9Xz2
 Q2I4p+Ltsk2qfG0NqkJ+pA5VL4g4MFcm6edXYOu5VL5pVRCJjBi/NwZdY7BfcYbsRTxDIFds5gY
 xooxsJJhGWl17W/c=
X-Received: by 2002:a05:600c:4256:b0:3b4:7cfc:a626 with SMTP id
 r22-20020a05600c425600b003b47cfca626mr10890396wmm.187.1664457408113; 
 Thu, 29 Sep 2022 06:16:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LDQVeCAUEANhQ0bqBHX/eSTYMGuClUv+NiDCqHW52d2JkXhi4syd+HG+jUXjDfUsio4XSjA==
X-Received: by 2002:a05:600c:4256:b0:3b4:7cfc:a626 with SMTP id
 r22-20020a05600c425600b003b47cfca626mr10890366wmm.187.1664457407910; 
 Thu, 29 Sep 2022 06:16:47 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 f13-20020a056000128d00b0022afcc11f65sm6673957wrx.47.2022.09.29.06.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:16:47 -0700 (PDT)
Message-ID: <9535cb0b-8684-c189-6779-971882b9bd62@redhat.com>
Date: Thu, 29 Sep 2022 15:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
References: <YyyxrNp+5XrmLi1Y@fedora> <Yy1gB1KB3YSIUcoC@redhat.com>
 <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
In-Reply-To: <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/2022 15.01, Stefan Hajnoczi wrote:
> I still don't know what the failures from the Avocado tests are:
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466535
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466546
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466539
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466548
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466537
> 
> There are lots of logs and I don't know what to look for.
> 
> Any ideas?

These are likely the ones I reported here:

https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00234.html

Should be fixed by Peter's patches here:

https://lore.kernel.org/qemu-devel/20220923123412.1214041-1-peter.maydell@linaro.org/T/

  HTH,
   Thomas


