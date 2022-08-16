Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A96595248
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:00:13 +0200 (CEST)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNpcZ-0007gK-Td
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNpaO-0006GY-7b
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 01:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNpaL-0008Ev-KH
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 01:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660629472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6uzlhSkyHBvHDcxBqgfTOJV8zxTDXQawVrBOzuQjSE=;
 b=XLHUCyKPw6qpDEHf1LRh8ST/APfuRUfOzmYAArqCHGxtAVL3Wwe2o0S9E/O6SI3ZH/vARU
 QsV46ABD7SsfTx0stpC6I6c9P+nBJ7dUKTmN6e9MDTYNlh70/t8bv1N0bXrbmk+QJ4bLiR
 fKOqKXVhKk4Zo1GeL0d3ifyjFO7oZ3c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-zzKbdn9jN7iZbIAwjYUF9g-1; Tue, 16 Aug 2022 01:57:50 -0400
X-MC-Unique: zzKbdn9jN7iZbIAwjYUF9g-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfba4c000000b0021e7440666bso1566043wrg.22
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 22:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=t6uzlhSkyHBvHDcxBqgfTOJV8zxTDXQawVrBOzuQjSE=;
 b=lrOBxaYJinZNuJFBZaqgeekloklI5r6mNrhXAR2dxMRUTFEIAQR0RGhBmQXepOf5c/
 0/hULHVS/eT+sJ3rxgdC9HOFzJHCbNXkxZbt6TQpC/LXZ0qOypE90ECqbUxVGNbrk/Md
 MP6yx3WNRjb57mlugySUQxqQ6TlkGrY/i1MjoqlwLtmQKOf4Yvj4Rx/jaUUjGQpYXh8l
 jjteqyoMbEPcMGYnPSFdfBzGIuXf4jzB0GsIoQXHtaCmPCsIAllR38zJ2hqAaCwNrGL1
 gNhx6SnM08uJB7DyK+DRsdgU73RMVB593u3AX9QVQxxUF0b92n3GWoa9Xtr74KI3mXJT
 4lIA==
X-Gm-Message-State: ACgBeo1nA5oskmAcXQaBGdRXeEDHOkYbP7q1yhsqhzfZlSOXQCBmmjka
 5gq7U1gIiucLYicwRyaIZPVA2Uf4GkF9bzKqLZ7mM22HEqqDsEbY+ad2sFfCEZ/JH3AOwmYMyeA
 5Ph+M7OUvclXUSNY=
X-Received: by 2002:a05:6000:a13:b0:220:62e6:5f79 with SMTP id
 co19-20020a0560000a1300b0022062e65f79mr10565408wrb.45.1660629469751; 
 Mon, 15 Aug 2022 22:57:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6TJAbtnuK9hSFMfi5QTpmcAdzQZpgwGtMLkZoDOh5BSi4MnLeDIMqidI5aAt2FENvfx7KrbA==
X-Received: by 2002:a05:6000:a13:b0:220:62e6:5f79 with SMTP id
 co19-20020a0560000a1300b0022062e65f79mr10565400wrb.45.1660629469504; 
 Mon, 15 Aug 2022 22:57:49 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 bh13-20020a05600c3d0d00b003a550be861bsm11914048wmb.27.2022.08.15.22.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 22:57:48 -0700 (PDT)
Message-ID: <5be99de3-f5d1-e850-f59f-13571a83fafb@redhat.com>
Date: Tue, 16 Aug 2022 07:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Bluetooth support in QEMU
Content-Language: en-US
To: vaishu venkat <vaishu071998@gmail.com>
Cc: qemu-devel@nongnu.org
References: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
 <9e3a4a71-7d96-9fab-2d4e-4167b2f248f7@redhat.com>
 <CAEcBaE1fmko6BTgKXtUdd3JcJRZP7Obq6LvXLdUtDAkVmrG9hQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEcBaE1fmko6BTgKXtUdd3JcJRZP7Obq6LvXLdUtDAkVmrG9hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 16/08/2022 06.22, vaishu venkat wrote:
> Hi Thomas,
> 
> Thanks for prompt response.
> 
> We currently using the QEMU version as below,
> *
> *
> *qemu-system-aarch64 -version
> QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.23)
> Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers*
> 
> Could you please guide us with the, how to access the real bluetooth devices 
> in the guest*

Simply search for "QEMU USB passthrough" with your favourite search engine, 
there are plenty of help pages out there.

  Thomas


