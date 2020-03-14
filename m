Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83018555A
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 11:00:12 +0100 (CET)
Received: from localhost ([::1]:43297 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jD3aV-0001rw-7D
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 06:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jD3Zh-0001SF-Mx
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 05:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jD3Zg-0007FO-S2
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 05:59:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53237
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jD3Zg-0007EE-Oc
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 05:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584179959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yV1zepUOMnECjOqshWti32Mo8FGEjDX/Wc9t4hjTbCw=;
 b=Xs3Q+XDShgzWcWzUjlSA8rkZTZAsnZG+Knl+nFPoihMO7YP4HA7dGLnWxD9Fo36YgbdTpQ
 y+ycfRw6EPFUu6yLk04ZQKFg9P6yWyMJ0JBIVgNX/LsG04DlGqCXuhkPFoMmlHk0d6yWWl
 e4BI5djYNCOFx2G9Y1XGUVpetVai55w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-lzJTF3HUPXG2BQl46T_nNw-1; Sat, 14 Mar 2020 05:59:17 -0400
X-MC-Unique: lzJTF3HUPXG2BQl46T_nNw-1
Received: by mail-wr1-f71.google.com with SMTP id v6so5662263wrg.22
 for <qemu-devel@nongnu.org>; Sat, 14 Mar 2020 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yV1zepUOMnECjOqshWti32Mo8FGEjDX/Wc9t4hjTbCw=;
 b=UZTKzHkiWdGb4l+BNQ34yu6o97GTp1Cs+6sNDU5gsK+JgcSIRTlTFkIZiA4uYoHX2R
 mVzPgnrf9xw86doXreFExrvpP1c6CAdl8bMYE1iweHuHFCld+k2SseXjIh9t9Rrzzxs4
 yhXuPqxCoWNpLzO4Jqg7CV3mHisFICSML6Yhi6Ucn/eCyiB4zt9yd4ogH0+V2RoF4q/g
 Pgigv2fmSRRrCLNI68SbRYeKswPmULsuwhp5nFkciFHXKzXIR+S0RtyabB/o6H5pIRpY
 IKcDddTukqtsegvO53FUz7a0VtfN5rFT4tRTYaa9lZru1hF78R3ngZ0nTGasmRBedd2+
 Ejuw==
X-Gm-Message-State: ANhLgQ00rCTlx8MDg2pJjJOc0fDV2tV4GhxaCKuoHOn2PJzw75w1YXZd
 JEUSUqMUksancZ0w1u30/waYoW+vjnjlaHRI9FhvsQMZMSDSQ5dJYdVqYaQXWlYT52VsBJkT1ML
 hEDD5fngKlMzEO5I=
X-Received: by 2002:a5d:4488:: with SMTP id j8mr873463wrq.306.1584179956324;
 Sat, 14 Mar 2020 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsymuuaj5PCSrWNwP8oxSaYxxhxneLGIJwVJ5tXEaRhsLUa6PKLPH/fwtp6QfQMDb77vGj/Yw==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr873441wrq.306.1584179956131;
 Sat, 14 Mar 2020 02:59:16 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.174.5])
 by smtp.gmail.com with ESMTPSA id a1sm25577786wro.72.2020.03.14.02.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 02:59:15 -0700 (PDT)
Subject: Re: [PATCH v2] exec/rom_reset: Free rom data during inmigrate skip
To: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
References: <20200313155939.240533-1-dgilbert@redhat.com>
 <CAFEAcA9ncKw-F8PdtLyGL6utxfo0YyZi3XmfOB33nu_xddf2tQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e3ab9c20-baa0-c173-be94-a1378385f62d@redhat.com>
Date: Sat, 14 Mar 2020 10:59:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ncKw-F8PdtLyGL6utxfo0YyZi3XmfOB33nu_xddf2tQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Yan Vugenfirer <yvugenfi@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/03/20 17:02, Peter Maydell wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Queued, thanks.

Paolo


