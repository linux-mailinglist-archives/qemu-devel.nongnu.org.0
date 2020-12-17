Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC12DD115
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:07:30 +0100 (CET)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kps49-0002dj-PO
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kps2a-0002DM-E5
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:05:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kps2Y-0008L4-Ss
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608206750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PyzW3TjmxkE5zJN8q1r1prpSqCjbXE68drkvLvXc9BI=;
 b=CBg4mNAfSc2R/9DPeKioHDubHDYK5Kfwy98Qgf0O4Z4jcplkz4CKhD+xDawmqBUOePafmr
 NZ5aKSBpiYzjaQbqQNVeXcnsLIYu9s3ne/3WjLB5khF70sIakyokKbW9sClH128HXAKrjK
 Yx6vmQNBFOengnZks8cT8WxU31nbP3Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-S1_uKtlmOnmKmxSGnd97Uw-1; Thu, 17 Dec 2020 07:05:48 -0500
X-MC-Unique: S1_uKtlmOnmKmxSGnd97Uw-1
Received: by mail-ej1-f72.google.com with SMTP id n17so8577469eja.23
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PyzW3TjmxkE5zJN8q1r1prpSqCjbXE68drkvLvXc9BI=;
 b=f7aqvHQ4SV/HvEOZCiQtGWRRNmq6hYFykxEoEEUQHJXHB4LrnsiPer2Q389EbebthA
 TVJK3TNPwaWKL/Up1Y3namvmppgrqbU58S5jXcxt3KIZ4CtZUWyOXElSMyzuY2m3Zoz+
 XIgKdaetqDP3scZJe/rg+rD9SCsFbCW3zMnSJA/ubWkhHFOtZmfMjq45dDG4QNa4ZSm3
 hoVGoeP2c3j+b8zCqektDlVW+jXfUd/S2jgPcBCqigoTw3IGBgLeg7gWH/7mIoTz7/8a
 5SfUEETecJg6Nsbu52yPZT0rPKJm7GEHjw03FrfSbGyRAe4u7DabazELkv0rRqCVK5n2
 Ouuw==
X-Gm-Message-State: AOAM533TNc/IXDt3U/1rMvUU9BmXiuYxB2gFSQ3tmjpVy3YsTmcYDSPo
 6MBWRQO8uEMa0RtT4uhon//X7CAhqbReLknXGizBVdy0ciepI5aoLC1oFtQYqVGJWCHw9xn4ZWp
 1v/Lyy7P8XYowdyWl/CSrkUAqYVRBvYC0rfTTWnnaqHTdpNf6idOKjtJitA1u9mL54as=
X-Received: by 2002:a17:907:9705:: with SMTP id
 jg5mr35193374ejc.448.1608206746003; 
 Thu, 17 Dec 2020 04:05:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4WGSbnJ/vX1ZktP4X2tANAvWyK2BCxuSQIah+sBPsVgz/5ZZ2HWpP0FqKIYnNsiGMewb1jA==
X-Received: by 2002:a17:907:9705:: with SMTP id
 jg5mr35192886ejc.448.1608206740598; 
 Thu, 17 Dec 2020 04:05:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lr24sm3617606ejb.41.2020.12.17.04.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 04:05:39 -0800 (PST)
Subject: Re: [PATCH 03/18] curl: convert to meson
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-4-pbonzini@redhat.com>
 <CAMxuvayRJiJNP7xS9BXaSpvfdYBiAbJcTjRJB-Q+wsLM=PPoVA@mail.gmail.com>
 <CAMxuvaxTdkqtYX79DfnyxHYViu6o54egf50cTCWTYbM_6T1t3A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <149ff9c4-1e0f-ab92-6f02-592e8081c359@redhat.com>
Date: Thu, 17 Dec 2020 13:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxTdkqtYX79DfnyxHYViu6o54egf50cTCWTYbM_6T1t3A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/20 13:00, Marc-André Lureau wrote:
> 
>         -curl="$default_feature"
>         +curl="auto"
> 
> 
>     What about default_feature=no ?
> 
> 
> Oh got it:
>          $(if test "$default_features" = no; then echo 
> "-Dauto_features=disabled"; fi) \

Yeah, Meson has that feature natively.  The plan is to:

1) remove xxx="$default_features" altogether by moving all options to meson

2) possibly remove xxx="auto" by resurrecting the introspection-based 
command line option parsing script.

Paolo


