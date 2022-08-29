Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC15A4A1E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 13:34:30 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSd2D-0005xA-9A
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 07:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oScyg-0002o4-3d
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:30:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oScye-0002gK-DG
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661772647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrAjKItzVrjIIm+cJ1qfqQcUl7edoJhbCqauLQj2bOw=;
 b=A8KdFuqnxE922HhUdr+RUlLZT+8A05Qw4lguHJSF8iP3sz/tkanmSeWGYDd+kA/IPnPjvX
 U2PkwREWfOJdlujsyWBSuTDWcmmnfNmwNJyGfma7u3T4scdRmLu3BZRD42stuVy6OYFeUw
 xA+XKhUuAW14ul/2XRR7mDGOGLO4PgY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-PCiKyxzjOaKDkq4oQ0Npxg-1; Mon, 29 Aug 2022 07:30:46 -0400
X-MC-Unique: PCiKyxzjOaKDkq4oQ0Npxg-1
Received: by mail-wm1-f69.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so8331525wmc.2
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 04:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BrAjKItzVrjIIm+cJ1qfqQcUl7edoJhbCqauLQj2bOw=;
 b=tUTZtmrTK9G2ymVPdqGTigR/TbQ5fNgW0xfqkx1eL7YAxzhMNP75wrPCz0dTbP7JLQ
 pFusF2IMu+eQFjbx72y6mvHOZ5ndKMLvUM3kMP3TgRlVVC0L9MqiVGgvqZ4I8HmzGltd
 BWz5RWGlHimlYzFtZqAAIlNC8DGkL+oK2KuggHEglEIFFYtR62i3JH0yYriAChVVze+N
 Yv0T16KClQCX2WGZnC/2KVWsfnQGzXgkBtMga7lGuvRDip5ovFHSdEpQ5XSesEB/2EIk
 8ThGM78+CekARHvpXmRIQVUG3d1TP4h06InzdY4dXrqmWdOURJAPG+hiOIKffPpcIp3Q
 H70w==
X-Gm-Message-State: ACgBeo3UKBuLNWGvp54FJbgWzlRKFwfR3FuiZsrV3DsjOTR1JP+lJ4rk
 ZTN29eMTCPzuVIGq2Dfdsh8L49EOEQeEzrW6J/83LiVaR7Qt8wn1VaRITh2F0hY3x+E6cqcAE8c
 VPC17/zNaQ0Y37e8=
X-Received: by 2002:adf:eb0e:0:b0:226:db7d:6fed with SMTP id
 s14-20020adfeb0e000000b00226db7d6fedmr2466788wrn.626.1661772645252; 
 Mon, 29 Aug 2022 04:30:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7QCW52yITJ8DBXrKPRAzy+WHj1Rd8Ep/2PzkfYsXFbUo8g01laiBBaL2ohTkbvGPZ4NxY+lQ==
X-Received: by 2002:adf:eb0e:0:b0:226:db7d:6fed with SMTP id
 s14-20020adfeb0e000000b00226db7d6fedmr2466772wrn.626.1661772645031; 
 Mon, 29 Aug 2022 04:30:45 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-147.web.vodafone.de.
 [109.43.176.147]) by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b003a4c6e67f01sm4645845wmq.6.2022.08.29.04.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 04:30:44 -0700 (PDT)
Message-ID: <d2a6c9fd-9404-fc38-67c7-53811a0ac574@redhat.com>
Date: Mon, 29 Aug 2022 13:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 16/18] s390x: Introduce PV query interface
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org, seiden@linux.ibm.com,
 scgl@linux.ibm.com
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-17-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220811121111.9878-17-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/08/2022 14.11, Janosch Frank wrote:
> Introduce an interface over which we can get information about UV data.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>   hw/s390x/pv.c              | 61 ++++++++++++++++++++++++++++++++++++++
>   hw/s390x/s390-virtio-ccw.c |  6 ++++
>   include/hw/s390x/pv.h      | 10 +++++++
>   3 files changed, 77 insertions(+)

Acked-by: Thomas Huth <thuth@redhat.com>



