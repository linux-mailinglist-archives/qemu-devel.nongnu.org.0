Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E26353FB45
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:33:09 +0200 (CEST)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWWK-0006oQ-B2
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyW0m-0005Sb-2K
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyW0e-0005ES-EJ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654596023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gLnfpwWRQ0tEyEys/efjhceKVfO/r5OEb3frOaOCr54=;
 b=TCuji88921/NK25YmbVukAa/r/39H2xLRU3xOdWuibnAlNJkX1Xk1ihp0E80kjUmAaJ+kG
 SMWGxDTQ6D7nBB3ZNsB5tx+S0Y/iNDb5jLfbTkC/494CA8eLU+gmA6gD1XSOx6xLQzRmCE
 T+P9cyX+Qm8unoQ822p6zyluLla++uQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-J-rvg86iPSW36Ruvscup0Q-1; Tue, 07 Jun 2022 06:00:22 -0400
X-MC-Unique: J-rvg86iPSW36Ruvscup0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 i10-20020a5d55ca000000b002103d76ffcaso3728004wrw.17
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=gLnfpwWRQ0tEyEys/efjhceKVfO/r5OEb3frOaOCr54=;
 b=2ZdSAMVN1sC6gqFKzbAwWwMoFphku+MhFSlzxIXDta19zJ4O1FPdyJ7NzEyjNr622o
 1ny1mXhgHubHNSBTf7CRAdFFwEq5femr+NM6r56jLcMw07NwNU0upRdaS97EMgdYfzfC
 Ir72qFWQENpB3Mvu5sbVb/pO4JB/WATRGLKuo7CIhUriFIBsUwPwVxmlwpU4y7+GofJl
 8egMIBH6kqreFjAbSrTNK+wHylUJRtyOWkk/MYOgdB7TKCpGEFYurbQPrmGETiY26m9K
 MXJS9c9kGufkLF2uxptAw+hK/XY+jeaZ6rxRZK+cORr64GdsrW3vcVozWoKxEWBRCEHN
 M2NA==
X-Gm-Message-State: AOAM533ybtXxqXS4kW/BRgAVmXBbXSi5vW4NnLqizK3d7WpaoO50hhDu
 UGeCoK/Kyp2GMra83vVTFFrWo7JtSZRKn6wM7P0UTc3oXZKnn2+VlbH1GXJKgFpUQ+Unz+JL/HX
 7yn0WZ544YUVqTIQeL5FtuuJpvEH3s8ROT/yUDgoPETwHv4ysP30axq0nOGfPdKXzBg0=
X-Received: by 2002:adf:eb4c:0:b0:20e:64b8:1ce8 with SMTP id
 u12-20020adfeb4c000000b0020e64b81ce8mr25857944wrn.609.1654596021009; 
 Tue, 07 Jun 2022 03:00:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5ju7Kr7oCnxsGyvOYlMmKzEqwj/tnlqKIDEV1RGOxEz3s2K7n9iBiu2G2nyHiuLRAb+5dyw==
X-Received: by 2002:adf:eb4c:0:b0:20e:64b8:1ce8 with SMTP id
 u12-20020adfeb4c000000b0020e64b81ce8mr25857918wrn.609.1654596020723; 
 Tue, 07 Jun 2022 03:00:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 e16-20020adffc50000000b0020fdc90aeabsm17495948wrs.82.2022.06.07.03.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:00:20 -0700 (PDT)
Message-ID: <9375811d-b96f-7618-7b35-945b85501500@redhat.com>
Date: Tue, 7 Jun 2022 12:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/7] More tests/tcg cleanups
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
References: <20220607094031.1227714-1-pbonzini@redhat.com>
In-Reply-To: <20220607094031.1227714-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 6/7/22 11:40, Paolo Bonzini wrote:
> Building on the introduction of config-$target.mak

Brain fart, or perhaps selective amnesia: building on the removal of 
Makefile.qemu.

Paolo

> , make tests/tcg a
> "regular" subdirectory that is entered simply with "make -C", like the
> ROMs or the plugins.


