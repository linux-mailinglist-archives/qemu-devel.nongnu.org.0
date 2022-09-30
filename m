Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10895F0C2B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:05:53 +0200 (CEST)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFiD-0002AI-1G
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeFbv-0006ri-7Y
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeFbs-0000Hd-2L
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664542755;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIPpLvVsXyGSV/6hVBfNJb7FroTAcs3NYjH1ggKZrgg=;
 b=L856nh9rxtZHon/8yh/7GRVc+1xVnkgVFc+VnKwDT7Jd0aqgANNxsK2p0EaC2nQ3ADlsYl
 vE2WNT6K0MiJqiwepnW3HajU2YUu+4fy3RMNd/KK5Kn5IFuduDSTsbwJRcIaNiwplYSR5J
 8LP0ZlK/Yn3/YBXKMzO//CZHd40Ph+Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-47x-GCYPMaiO_0c6NVgz_Q-1; Fri, 30 Sep 2022 08:59:13 -0400
X-MC-Unique: 47x-GCYPMaiO_0c6NVgz_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 g8-20020a05600c4ec800b003b4bcbdb63cso2038356wmq.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 05:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=SIPpLvVsXyGSV/6hVBfNJb7FroTAcs3NYjH1ggKZrgg=;
 b=l7BfNOmMdNpM2kQpEu8rHkqtflk0CNedSjE2k7G+wcUEMpgw3cOScFGXZEiCnsr7ii
 a4xHHg0/TutNUpV2Zqa8jDQm0xdbHJqZpRc9jO7z6c6wBOZxFS85yXSaqyvsMshLZBoR
 wkDCVRqg61j3gUgY+aJXBAcP282iSjXrHNO312IMg07LwBHfOEqaud7LE1Vi04HEqR6/
 MDSFFTzqqFLCy22E8b6XqPXBO5S+x6k5JQPq+Z5ha8aK03STrxsm7qQwP1yEiFXUJMTO
 uUw22+8Dx/mESW5bsnBikhdhbaRJkP/hIalzl5vmTIjlEQ78m+ZOFkszmddQST2X/yPW
 ItZA==
X-Gm-Message-State: ACrzQf1K683wuRDg1eXTf2r9s44weLBsTOYMO5Xsl1ZbrSg9vsALQE1L
 yvIbL00h927D3gx3r/2/f4H0tbEnz0LYKIk7w0iQt1uLEkxfpGlMY7M0ZYhZtBKy7BpLaLtTpeK
 uOkn4hlTHigeDEsg=
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr5791609wrr.472.1664542752045; 
 Fri, 30 Sep 2022 05:59:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5nqbJQN6NOVoL/OIsoWfxzOqUxyiopcx1NPh6B3rqkCtlhpWO97v1ZcrdAJlozPLBkxLy/Jg==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr5791583wrr.472.1664542751681; 
 Fri, 30 Sep 2022 05:59:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003b5054c6cd2sm9042899wms.36.2022.09.30.05.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 05:59:11 -0700 (PDT)
Message-ID: <7387a737-21c0-ebf3-2756-b865c7dca04f@redhat.com>
Date: Fri, 30 Sep 2022 14:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220930113824.1933293-1-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220930113824.1933293-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/30/22 13:38, Peter Maydell wrote:
> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> there is no pending signal to be taken. In commit 94ccff13382055
> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> generic KVM code. Adopt the same approach for the use of the
> ioctl in the Arm-specific KVM code (where we use it to create a
> scratch VM for probing for various things).
>
> For more information, see the mailing list thread:
> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
>
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The view in the thread seems to be that this is a kernel bug (because
> in QEMU's case there shouldn't be a signal to be delivered at this
> point because of our signal handling strategy); so I've adopted the
> same "just retry-on-EINTR for this specific ioctl" approach that
> commit 94ccff13 did, rather than, for instance, something wider like
> "make kvm_ioctl() and friends always retry on EINTR".
>
> v2: correctly check for -1 and errno is EINTR...
> v3: really correctly check errno. This time for sure!
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5c1bd50d29..1e4de9b42e3 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (max_vm_pa_size < 0) {
>          max_vm_pa_size = 0;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    do {
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    } while (vmfd == -1 && errno == EINTR);
>      if (vmfd < 0) {
>          goto err;
>      }


