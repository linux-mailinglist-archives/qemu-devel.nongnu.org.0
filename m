Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A4F559742
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 12:03:05 +0200 (CEST)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4g9Y-00067C-PN
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 06:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4g7E-0005B9-Ss
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4g7B-0003aS-GS
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656064836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7J4sHkfHi+DRdjvc1Re12K+9uABch9P13WoOjORI5E=;
 b=bu5y0hNT/4SKeAeWkHU9TM4DBL7xw8DJXemRrta55F0B+dO1jcVCNBZwYiK35VUPwZgxbw
 G8tRSFPMYh/RQumBsH7p5Nt5pgvqrgZq2eg+ztrKTm05dJBqIaaw1xC9p1YRG+j33QKUxS
 6UriGGCdxvoeTr99RZvTaFTKmwYU890=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-TvdJAGluOteCIiMy6zcpLA-1; Fri, 24 Jun 2022 06:00:35 -0400
X-MC-Unique: TvdJAGluOteCIiMy6zcpLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j31-20020a05600c1c1f00b0039c481c4664so821860wms.7
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 03:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K7J4sHkfHi+DRdjvc1Re12K+9uABch9P13WoOjORI5E=;
 b=GauVkviewT9tZU6SpSdJM8De2TIV6hE0qDatRr4EkjqyghL2neOjgSPdL/hNtevZO3
 T4/Vw4pZlO8/0QrWRqiGMLH3syspWGJ/bsCkm/32zxp3x4h29IDrndv6NTthUv7YcV3F
 gWIjTbZ++P/FBHvon5dUErHnwxUQadZ8RDNxYjXP+uH19DpVOz4yCGGXK7ieU3zdnX09
 MV5LX5vC/XUvUz+ndvWKlSZtfAubsmRsSd0q4kH2WN6oB4zmi76zva9mIcZa+ahzkYqR
 01o77jCpO6aXkmG7f+Ev0iQw+Uq7lBy2/2G7i56/b9viHTSOrmEKoGO633wwBn1v8DrA
 35fg==
X-Gm-Message-State: AJIora//l8t2t84FGN29cff9s6vFXecin343dW+Gl5XIU6uPVLsHq4EC
 2E/d02kJ+9uhseUlIc/tce8acaZDlE3s4jd3lnwt/UAMkV/LCVEgFIQzuSc6XRqczSps7RZCotp
 fgspoVJEryHKMp6s=
X-Received: by 2002:a05:6000:691:b0:21b:8d0a:6035 with SMTP id
 bo17-20020a056000069100b0021b8d0a6035mr12854220wrb.230.1656064833981; 
 Fri, 24 Jun 2022 03:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1si2HX4RGtwKj1RvjIKlt2KxPUfBqwZ9LqpiRYsWKQKej8PZCFjdQR5W8WlXwId8ZGmhyrBQg==
X-Received: by 2002:a05:6000:691:b0:21b:8d0a:6035 with SMTP id
 bo17-20020a056000069100b0021b8d0a6035mr12854202wrb.230.1656064833791; 
 Fri, 24 Jun 2022 03:00:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-192.web.vodafone.de.
 [109.43.176.192]) by smtp.gmail.com with ESMTPSA id
 g1-20020adffc81000000b00213ba3384aesm1905953wrr.35.2022.06.24.03.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 03:00:33 -0700 (PDT)
Message-ID: <f8f6a5d9-5ec5-8cd3-ccc9-ff06a80e4a74@redhat.com>
Date: Fri, 24 Jun 2022 12:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
 virtio_ipl_disk_is_valid()
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org, 
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
References: <20220624085037.612235-1-thuth@redhat.com>
 <20220624085037.612235-2-thuth@redhat.com>
 <fe1d0e25-b582-0220-db7e-c69df5460f51@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <fe1d0e25-b582-0220-db7e-c69df5460f51@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/2022 11.20, Christian Borntraeger wrote:
> 
> 
> Am 24.06.22 um 10:50 schrieb Thomas Huth:
>> The s390-ccw bios fails to boot if the boot disk is a virtio-blk
>> disk with a sector size of 4096. For example:
>>
>>   dasdfmt -b 4096 -d cdl -y -p -M quick /dev/dasdX
>>   fdasd -a /dev/dasdX
>>   install a guest onto /dev/dasdX1 using virtio-blk
>>   qemu-system-s390x -nographic -hda /dev/dasdX1
> 
> Interestingly enough a real DASD (dasdX and not dasdX1) did work in the
> past and I also successfully uses an NVMe disk. So I guess the NVMe
> was 512 byte sector size then?

If you're using a full DASD, I think this was working thanks to the 
virtio_disk_is_eckd() function recognizing the geometry.

For NVMe disk - no clue. It either used 512 sectors, or it was at least 
accidentally still able to deal with the 512-byte sector requests after 
virtio_assume_scsi() "fixed" up the geometry. If you've got some spare 
minutes and still have access to those disks, it would be interesting to 
know if the boot still works there with my patches applied.

  Thomas


