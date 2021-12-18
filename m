Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6B479BBB
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 17:17:53 +0100 (CET)
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mycPA-0000FR-Iv
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 11:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycMI-0006nL-72
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycMG-0004Rh-Or
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639844091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9JAspWDxoN32nB2HBrGR7OdkVfzEIdRxQ+H3tJGzOM=;
 b=coQC/GHd01QRqeOYgH78keQI7n5Otmxp+ygTncj+Gl8yYnsNXLjnM2MDJV7AKm9/5FhVoM
 PH9Cu4julqYjlD881PYlQCEfLGijHewofeknZhYXnv6vRuCk/rROblBJpzogWsy113TlTd
 Bz8O04sE3us0HSwF2U567+IiGRouymU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-9wzSu_8tPCudJuHnC4Bu2Q-1; Sat, 18 Dec 2021 11:14:50 -0500
X-MC-Unique: 9wzSu_8tPCudJuHnC4Bu2Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so2541618wmr.3
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 08:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R9JAspWDxoN32nB2HBrGR7OdkVfzEIdRxQ+H3tJGzOM=;
 b=XNSU4k1v7Drv5Q30B6bJGyYUvKMtC/Ah/9v8ZGlY06vCl5Lt1rCWpkssra2LrfvFv7
 B5AV0NYx4OILeJuLDe3nXTRKLe6Y+D/dnSoMJMBoBkKlyhq0P56As3JOedvbIERd3fzY
 fmaI4ufe4JaYhDEaiXErGQk8qz49J1zS/RkaaFDfbN0gs+uknw2JUTQtorgPj2Zqr25P
 kCt/c7mTP6hla5xCItn4xAxs11Nmmq0jNezYfIx4sKnpiWUxH5/XyFiQrirdwI1qce+5
 TnK8kSuE5f+5NR6xlBcpzeu/etrJBbBgfey6VhAW2nYEMsznZWNV/5a0rEjI8VtKOHyI
 SNPA==
X-Gm-Message-State: AOAM530Xd7Rka/A3t8DOsGqFVKFqfTveQc+wCXhjgCkYPCvAeyquqIIX
 yd0KFBpLX6Hj3tQ5qYaTjL9280FRDJc3WYfwJplJHChocNbJTmZJBX3s5Dw3sFO49dOsTEYNA9R
 QXRpnbBg6w+aJ2CtI3j79ItpzCJf2L0Z25pVqQYnHs77LYeUv9kaP5s6Y0jkpX+Li
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2800345wrd.339.1639844089006; 
 Sat, 18 Dec 2021 08:14:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhPV/QcDykxBE6ofHPJbZ8rO1xjsVH046nKY2687oD2xe5dAPEPsssUUh29l7fJqKjmWyswQ==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2800320wrd.339.1639844088792; 
 Sat, 18 Dec 2021 08:14:48 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id y11sm13136298wry.70.2021.12.18.08.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 08:14:48 -0800 (PST)
Message-ID: <67a3c0ae-f4e8-2a3a-b9a4-fc74c1269519@redhat.com>
Date: Sat, 18 Dec 2021 17:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH 0/3] hw/audio/intel-hda: Restrict DMA engine to
 memories (CVE-2021-3611)
To: qemu-devel@nongnu.org
References: <20211218160912.1591633-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211218160912.1591633-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Martin Schrodt <martin@schrodt.org>,
 Thomas Huth <thuth@redhat.com>,
 Gianluca Gabruelli <gianluca.gabrielli@suse.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Li Qiang <liq3ea@gmail.com>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jon Maloy <jmaloy@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, crazybyte@protonmail.com,
 Matt Parker <mtparkr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 17:09, Philippe Mathieu-Daudé wrote:
> An attempt to fix the Intel HDA DMA reentrancy problem by
> restricting the DMA engine to memories, and reporting invalid
> I/O region accesses as overruns.

Eh reading again the gitlab issue I realized CVE-2021-3611 has
been assigned for this.


