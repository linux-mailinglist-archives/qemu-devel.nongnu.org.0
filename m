Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827DD53AA7F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 17:52:46 +0200 (CEST)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwQeL-00086U-3y
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 11:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwQcs-0007AL-Rm
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 11:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwQcr-0001Ap-0p
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 11:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654098672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPpREnj7hUQU3BlyfZXmqYhrF2VDsIKLWF32NpFEpBQ=;
 b=SMfru7N3AkSOZ8U3sZ27E3xEjDA4uFiCT0qJpqI1fxfWf8GdJQ+LIGvE0VV4cj9/QIwaby
 ogY2wLD+9BNE9pwyfB2/m1FJ3CrQrSufoIuZ4zmtKCoIby0KZsoil6NtfCrXphBw9OyqXX
 kQd7nVqDCWXP2fsbsY48HuPd2LpvF14=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-vxZTuLCGOKOGBu52IzkxTw-1; Wed, 01 Jun 2022 11:51:11 -0400
X-MC-Unique: vxZTuLCGOKOGBu52IzkxTw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n25-20020a05600c3b9900b0039733081b4dso1325543wms.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 08:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZPpREnj7hUQU3BlyfZXmqYhrF2VDsIKLWF32NpFEpBQ=;
 b=Xloep4CZkaMNOyyWoaGuRmP/crjAdSNnpouNqvXJ18z7gCn3zoI9gDs50s7KHZHGP4
 YLWoa8SLSofvHoWtKECMTsYAQWaWWMW4u9pEuoEOeOs8WSAKNGMF8A4Tw2qrsK1KmI4/
 KOYIrCYmrEhaKmqw1+egHZvjEW9dYCwBvo6+GilNJG1vLLOE1VThW1L7wv2nf/3f4imj
 yakvnlg/SmM+UwZr0f5XZsZv4paCu9ii88/GfCwLsXuF3DyfRhguVFI2Cwn2/4SoX7w1
 sUyBQt9bEIYJu7Fdj6wPOjbKZtGLCqmHqtAnmPfrHKrCIgpMTRtvL2vo5lWwk5LC/Nrp
 PK6Q==
X-Gm-Message-State: AOAM531ibeGkkGMz7i25cw2pey62lGG8GUNhNUaU9IDxwDnpYi8LtZrF
 1uU1DpE6JKJ6aIYo1io/H5FBchEMnaAVGbWOAlHlrhoNsi448OO1U3mKhLnrfmyxHMEWC/12Bb8
 RO9atflOxIyZgvNA=
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr25597wrr.583.1654098667831; 
 Wed, 01 Jun 2022 08:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybQFeBc3k/Cgyl66XlSiVZUk+9uE0/60rBwDnub3F7jVOI//t0ZLFzhX4TBn0JIkjLhO31eQ==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr25587wrr.583.1654098667633; 
 Wed, 01 Jun 2022 08:51:07 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-51.web.vodafone.de.
 [109.43.179.51]) by smtp.gmail.com with ESMTPSA id
 az5-20020a05600c600500b00397369667e6sm5457429wmb.39.2022.06.01.08.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 08:51:07 -0700 (PDT)
Message-ID: <739ea122-5eba-3f81-6486-a54f8d4bd7d7@redhat.com>
Date: Wed, 1 Jun 2022 17:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: Update s390 vhost entries
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20220525145814.2750501-1-farman@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220525145814.2750501-1-farman@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 25/05/2022 16.58, Eric Farman wrote:
> Commit 7a523d96a0 ("virtio-ccw: move vhost_ccw_scsi to a separate file")
> introduced a new file hw/s390x/vhost-scsi-ccw.c, which received a
> couple comments [1][2] to update MAINTAINERS that were missed.
> 
> Fix that by making the vhost CCW entries a wildcard.
> 
> [1] https://lore.kernel.org/r/d8d2bbd5021076bdba444d31a6da74f507baede3.camel@linux.ibm.com/
> [2] https://lore.kernel.org/r/87k0c4gb9f.fsf@redhat.com/
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---

Thanks, queued to s390x-next now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas



