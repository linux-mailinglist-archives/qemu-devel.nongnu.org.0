Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313D4D0503
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:11:42 +0100 (CET)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGtZ-0004LM-Bv
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:11:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nRGp0-00063M-8R
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nRGoy-0002rz-ID
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646672815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzQd8B6cIAS9+ifpROyoa4bPM3Lp4lLhsdtI2lG6gns=;
 b=Y1P6KGA+D3TdQO4WlAbHnoHmhwfnS2FbvF/DMIo+9RnZ1otWQICZ6B3Ll1358EumNb5y6f
 CTX2I+58Jg4vGGCWaTmdOuNFHezdkUMBa0p139cWzVp2DKpUkBOW/E4cH0ZfO8iJ9oi+zf
 f1YnCMRlPfRLvfhB48RkV4lcAIwAWBM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-y6_QET32N7uUU_oflSU0Dw-1; Mon, 07 Mar 2022 12:06:54 -0500
X-MC-Unique: y6_QET32N7uUU_oflSU0Dw-1
Received: by mail-ej1-f69.google.com with SMTP id
 og24-20020a1709071dd800b006dab87bec4fso3827373ejc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:06:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=xzQd8B6cIAS9+ifpROyoa4bPM3Lp4lLhsdtI2lG6gns=;
 b=tzErRFpSjFVrVqtVMJNoj+aeFTgX6gldFHFgEOREXidRNQAvW5MMKdRo7/hrWxC5jC
 a2ZiT7cNswZeSfJ7xVjJvFDPjjRKzNmtt10wFqQMIgK/dnPn78w3DF8pZlVBJR+FolDv
 xhOjJLyAKjkRXuh6TA/p2Jy1Z5snM+eRilGP8CHk2T995hNau9+lASRd89BAA6Io0lAf
 eOOTBHq7sIoa1kytqan1nQLMJNXhSdHJPlfLuRCTXeJpiHnsZH5EVslWitcpN0ufc+Q+
 Tb1Gx/GqKU+H7uQCjbmPMB9TIh5bYJSpE2Zp30kL0gsX/+/T+4RvpkvbJh7B4ekm6Xj1
 1Aqg==
X-Gm-Message-State: AOAM53106W01T95u9RK3SjXbZi+8TZYsxYutIhPN1Wbu/MSIchPAKkMd
 OhTwaIgF/UceDNQGJ2GKKqiF61y/hozn5Za35Q6W2v5I/JGRdvDzyTxGvDXX5O2E8esVlCAPdfl
 Os86voDQLQSSX+UDR9L/TVfQRXgepFcl/zTeo3JEFURBpePklIpLHCdGBEto8kpqFu14=
X-Received: by 2002:a50:9986:0:b0:413:bbdd:d5a1 with SMTP id
 m6-20020a509986000000b00413bbddd5a1mr12309170edb.26.1646672813282; 
 Mon, 07 Mar 2022 09:06:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1WadQqpdv+HdBlPJ/UT8eCs3FDYd2bMnmydePlOd4gU9o0GYbFQStZjMeLBZ3lezllu5aZA==
X-Received: by 2002:a50:9986:0:b0:413:bbdd:d5a1 with SMTP id
 m6-20020a509986000000b00413bbddd5a1mr12309145edb.26.1646672813014; 
 Mon, 07 Mar 2022 09:06:53 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm4940207ejk.119.2022.03.07.09.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:06:52 -0800 (PST)
Message-ID: <4ea11ddd-1032-3c80-4fbd-02ef08a5ce9a@redhat.com>
Date: Mon, 7 Mar 2022 18:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
References: <20220307151004.578069-1-pbonzini@redhat.com>
In-Reply-To: <20220307151004.578069-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 16:10, Paolo Bonzini wrote:
> +    COCOA_DEBUG("Second thread: calling qemu_main()\n");
> +    qemu_main_loop();

This should do qemu_mutex_lock_iothread() before calling qemu_main_loop().

Paolo


