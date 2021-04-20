Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C33365946
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:52:48 +0200 (CEST)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYprz-0007D2-Ew
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYppt-0005rz-UP
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYppr-0006Gk-28
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yl5hi5LDosrPPI8jMycbFSuctPajHSca1uqsoim0Aho=;
 b=S1nx1/q87Xk4Pb9j+Vgz+IUKEW/2qgCBNCZflAelU8EIFxjkXDQTVrHPHHNFyKO3CKKUXq
 YzVkafgjbZY74+ikIdTA3D4ClBzZI8oaekyTHOlD071VUxiy6516mOqhrwBI63q/XDyotZ
 4mh61cH00q27eNDV/48puTS/xCKPvfU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-_VkBNIfcNLGPLfh1DMZ6Bw-1; Tue, 20 Apr 2021 08:50:31 -0400
X-MC-Unique: _VkBNIfcNLGPLfh1DMZ6Bw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so10828484wro.8
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Yl5hi5LDosrPPI8jMycbFSuctPajHSca1uqsoim0Aho=;
 b=VRlbuioZ4dchRJQdThiZhrE/j36NwvT+HFnKVTv7KeJKWV1DKsBDf7azNJw1303HJ3
 5M6HZUtFm6HQgHyX53WSP5MbC0U8PiV8eu3R6sB9ROkBKNcknHRMFuz/Wk3NgqZM3jNP
 zJE/YnFVuNGeSttbPdxZNc4fpzIExxdmCIEzTyaOXr1Oi0Jeg65yo9KHoLS2oc9Ij3Ek
 nBJDWnS1Hpxl1QF1K22dwrpxAjy2c6v6949yIZtO/q0/VfwWmyBH9yC8tTq31upZ226y
 iVM2aEfRTTiHQzlbRyJ041ifHGFFYAbNvMKrEt8vOauD7oBoqSgYKQYq1vXpryx8znSD
 Pozw==
X-Gm-Message-State: AOAM533Wr2TxCBi+xc9dPyZ3fTdIQTlmwiAzivIMkXBfcGAMATgGdJLC
 SHfM/vPsqRGAZ4V+Mj/ZclPQNHjJBAtqF8VEHzxtIE1TvCaI16P7mBPPmMs2pwOp7bu6Di/FFXL
 OOaaL5t930oKr4MI=
X-Received: by 2002:a1c:c918:: with SMTP id f24mr4451206wmb.12.1618923030670; 
 Tue, 20 Apr 2021 05:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl9Ssr2hFSu3UU1ZnEWlu04rZup5qHpribVG94ugFWTVukOFbrGhcnPI2sd92xHvLmTNfJ4Q==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr4451193wmb.12.1618923030518; 
 Tue, 20 Apr 2021 05:50:30 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 n10sm3177480wmq.36.2021.04.20.05.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:50:30 -0700 (PDT)
Subject: Re: [RFC v2 01/13] hw/s390x: only build tod-qemu from the CONFIG_TCG
 build
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-2-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8f330bf3-585f-8d4e-d3ec-fa341accb18c@redhat.com>
Date: Tue, 20 Apr 2021 14:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420103616.32731-2-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:36, Claudio Fontana wrote:
> this will allow in later patches to remove unneeded stubs
> in target/s390x.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   hw/s390x/meson.build | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 327e9c93af..a4d355b4db 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -16,7 +16,6 @@ s390x_ss.add(files(
>     'sclp.c',
>     'sclpcpu.c',
>     'sclpquiesce.c',
> -  'tod-qemu.c',
>     'tod.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
> @@ -25,6 +24,10 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>     's390-stattrib-kvm.c',
>     'pv.c',
>   ))
> +s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'tod-qemu.c',
> +))
> +
>   s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
>   s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
>   s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


