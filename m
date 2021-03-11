Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782913370DE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:09:45 +0100 (CET)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJCK-00020S-JI
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKJAo-0001Rb-C7
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKJAm-0001wk-TI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615460887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6fUXd8m9PfuYnYPm2Gj5RI3RQ1uCqtVpOmhU/Ne34c=;
 b=Z7UEl3Bs+tUJtSg+f1flcrJxnWKjwvsVi7XEcF3MqKlFCV9wWL1knSdOnCtj/fwbGT3xsi
 AEsF1fq0KNXWNmnVAbzJWBoPwe7v1Nd0xYHCCTotZF3uwwM501mL/4Ex6QZv6GSG2VSq/U
 GCXTfpI69b/UGbARrPnGfH3OKELSsTw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-OKycMRqeOsebz1xjgeOT1A-1; Thu, 11 Mar 2021 06:08:06 -0500
X-MC-Unique: OKycMRqeOsebz1xjgeOT1A-1
Received: by mail-ej1-f69.google.com with SMTP id gv58so8532019ejc.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 03:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z6fUXd8m9PfuYnYPm2Gj5RI3RQ1uCqtVpOmhU/Ne34c=;
 b=bCKZNL3V2SQ+L87Mp5d2VahGPhi7gAMPG7M04bkPFkSeFO6AmqvxxDNEPDIAv4vqEJ
 U2Vjfb0/NdIsMtsPS4LzdW3bllqtck+ZSIFR8DTyp9bWe16AUiVC1dRA1iCsX9BfdEs1
 idv9sXPcFlGb7KkKs0DectmjlgwH0ocl1riPYy1F0TbSFblgEmBnMXLBOht6BdrejSW3
 MhxnLYqnDlmCoSFIxAry0sb72TE4N/vz1vu92kf5YW2kB4TSIU7wvXLPxlgnE0VFDeMX
 YcReo5auqZVQ4pL3c7hi/RHdEEZ/FIBVziDxxMpP0RYLq4mk9Mpzs93urQhCPCgYaPT1
 qqCg==
X-Gm-Message-State: AOAM531tiQdho173gm4B3leTGZN0XNDgF4SrWLiqH08fCGKMJ9kP/bfQ
 tliZpehBEXGBEyQf4CVEs01CdXyNLkCgviLMKO4fQfhuHTGzi56hIyXtdvu1YQxFwmOqXxlJvVA
 GTQKGol6QWx0ljsU=
X-Received: by 2002:a17:906:e2d4:: with SMTP id
 gr20mr2570470ejb.432.1615460884965; 
 Thu, 11 Mar 2021 03:08:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0gBl7j52baIM5NA3Ll+wiVCJE16tKmAfHo7DhMvSXDGgE48gSfEUPUF6y2jQKmeTg/qS1aw==
X-Received: by 2002:a17:906:e2d4:: with SMTP id
 gr20mr2570450ejb.432.1615460884709; 
 Thu, 11 Mar 2021 03:08:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z9sm1144266edr.75.2021.03.11.03.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 03:08:04 -0800 (PST)
Subject: Re: [PATCH v2 0/7] vhost: replace master/slave with more accurate
 wording
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210311103250.532191-1-pbonzini@redhat.com>
 <CAMxuvaxwDujPJN=JjADGE+=wDiBWjhFX+omJ_D8bmXJMPxRaZA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c5c32a6-a646-a6dd-f60d-6e7a831b674b@redhat.com>
Date: Thu, 11 Mar 2021 12:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxwDujPJN=JjADGE+=wDiBWjhFX+omJ_D8bmXJMPxRaZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 11:51, Marc-André Lureau wrote:
> 
> 
> What about renaming  VhostUserSlaveRequest too ?
> (subprojects/libvhost-user/libvhost-user.h & hw/virtio/vhost-user.c)
> 

I missed it in vhost-user.c (I did rename the values but not the enum), 
while in libvhost-user.h I'm keeping it for backwards compatibility as I 
don't want to break the API.

Paolo


