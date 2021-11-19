Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2D456BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:58:52 +0100 (CET)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzjP-00032A-BM
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:58:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnzeW-0004sY-OK
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnzeU-0000Zv-Vw
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637312026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8+h3u/TeWjCTJkkwIHnQxi03KfW+vbZKrPf11/2eUo=;
 b=BA8zRGzk6/xboPTetlhSr92ESa9Kg/Y2cSb5T+zgd90shE3LXvaq1AMjcIhqt5zloySwFk
 esA24P3WaakPnhY2uEToYdBYEjpJzp8z1vC6dlsd07k/eFdL7wzzAMFGl0gs/Gku0LOFUi
 3nhdm30ju146ngekRUdfH0BtmldNeP8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-jauvv3wPPVWBWlAlHJJBpQ-1; Fri, 19 Nov 2021 03:53:43 -0500
X-MC-Unique: jauvv3wPPVWBWlAlHJJBpQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 i19-20020a05640242d300b003e7d13ebeedso7796108edc.7
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 00:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b8+h3u/TeWjCTJkkwIHnQxi03KfW+vbZKrPf11/2eUo=;
 b=BY3wIyhysCeGPlYi0CddBgBN0Y1eQuLvSPwZ035F1XVyw7KZwt4j57vr4hd4/HD0ma
 /IQf+qlLaodZSkBlbkhjJ2ZDbuexDwpFEyAkc/AxV+/iNfabAxxcWrZt2/uiuEnbZNuc
 fmRlYNaaul4bOpi4XtpgqpjkuENR1yQT6PmzJLb1xZw7IF4u7ND6TrzppPnoWmBNduyC
 Xll+bRPhDev2sXzrJs4yOVSfVf4BnUDlCsT2w6Xd1G9G4TL1q9JACmRTJNwRSRmO8xIh
 OLTnEotQf+2P25Mg6yTJNblXL3DBAkuH3qRJcIF16PGBDnJ1lH+pq1URvSRr2d3x5nDJ
 LZ0g==
X-Gm-Message-State: AOAM5317N1wuq7D+xSNyT7up5LBjUvrKEmhzSFXctVhqv5MtLXBRm/pa
 VwleT2IZnZXw+8JCACCdvtAXedKzRn5y1jgFnd3rxyaVw5gc+3HZlGrOApxZ9T3SG/I605mXJ9n
 o4KpBE+E8hhl8Pxw=
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr5685804ejc.75.1637312022180; 
 Fri, 19 Nov 2021 00:53:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpGUrhpd7SFmzkVMEPFeBmLdwsj3UNl2RVAL13eNyLOtpNpWR6u3PCMrajYZJ9cdo6YZ0Ykw==
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr5685771ejc.75.1637312021913; 
 Fri, 19 Nov 2021 00:53:41 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id cs12sm902425ejc.15.2021.11.19.00.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 00:53:41 -0800 (PST)
Message-ID: <a897a755-9059-6552-7317-7637585b2a05@redhat.com>
Date: Fri, 19 Nov 2021 09:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] iotests: Use aes-128-cbc
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211117151707.52549-1-hreitz@redhat.com>
 <20211117151707.52549-2-hreitz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211117151707.52549-2-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2021 16.17, Hanna Reitz wrote:
> Our gnutls crypto backend (which is the default as of 8bd0931f6)
> supports neither twofish-128 nor the CTR mode.  CBC and aes-128 are
> supported by all of our backends (as far as I can tell), so use
> aes-128-cbc in our iotests.
> 
> (We could also use e.g. aes-256-cbc, but the different key sizes would
> lead to different key slot offsets and so change the reference output
> more, which is why I went with aes-128.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/206     | 4 ++--
>   tests/qemu-iotests/206.out | 6 +++---
>   tests/qemu-iotests/210     | 4 ++--
>   tests/qemu-iotests/210.out | 6 +++---
>   4 files changed, 10 insertions(+), 10 deletions(-)

Thanks, this fixes the failure on my system!

Tested-by: Thomas Huth <thuth@redhat.com>


