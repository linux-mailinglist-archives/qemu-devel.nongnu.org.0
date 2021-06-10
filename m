Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA43A23CE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 07:21:29 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrD8B-0001ae-L2
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 01:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrD77-0000sh-6Y
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrD71-0003dP-J0
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623302413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pa2/iuMn99xDP8Zwlk0QRb31w5sz2xiulpuOROkJpDA=;
 b=TKtt6ono5c6JIIArlwl3Lr4fDDkZ6MnxUaE81c1dI05Ap1Lqf7NL9X5gIXRL08dlJjBkSG
 sfzPB01cG8czeBjEYnUXCn+h6K6LZVyrnYEOwcBtImWP/bttIBmaX6T0i4eh1bs7k00eYX
 fcwcihJHT1Ncv6FBlXR332JCcX9lJOw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-GVQJw4BbOPOBU1hpziC1cA-1; Thu, 10 Jun 2021 01:20:11 -0400
X-MC-Unique: GVQJw4BbOPOBU1hpziC1cA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020a5d52d10000b0290119976473fcso319623wrv.15
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 22:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pa2/iuMn99xDP8Zwlk0QRb31w5sz2xiulpuOROkJpDA=;
 b=MwqB6X81qJWZyn1UFIP4TQQpLq+7aUrZ7R4Z2th3fSHKfMEGueRxPzUV0RPhjTH5m1
 f1GLKo7cINjONFhHuh2XAOoNdoPGxnZNoYkUz39NXg37avRYH25C4+uMIqdBJva3TO7b
 NoNGpgnS1m1SrJri8CCt+hIdjLz5/KEzx0d8A5UdmA7Cw5Y+fTAeLY06ZtIIYn/Us8tA
 jueGJxaVbSxXrNgxvp2HNKWN/c7yyySQWgsS3dkZ4vLCdCaqjcIEZpMheVTnn3KwweAp
 5+3kti2kv73efNyaLZiv64btuFDZkqAy5GH5eXIfBPEe+MWA40vuN6ffBHQu44WX2OyT
 pjsA==
X-Gm-Message-State: AOAM532p8lsWUV/kxjR9RCRtG2iGa0SGDeSob8MXUTp/MUBs7z0tg/v0
 crkHSXWozNMu77Wqw2heh8IQm+vTJ17BWISt1WIm44IiB3Cn/GWtPtT50IKm8y9xq586OUKU+9S
 3nwqCvX+QOHpgEkA=
X-Received: by 2002:a7b:c106:: with SMTP id w6mr3011580wmi.75.1623302410068;
 Wed, 09 Jun 2021 22:20:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpYebN38dLWzanO6IcCaDBC3n7VVTcn4JmdPZ9HNh9PK1yes8IyBm86tATHpTZjoytt284zw==
X-Received: by 2002:a7b:c106:: with SMTP id w6mr3011567wmi.75.1623302409893;
 Wed, 09 Jun 2021 22:20:09 -0700 (PDT)
Received: from thuth.remote.csb (pd9e839fb.dip0.t-ipconnect.de.
 [217.232.57.251])
 by smtp.gmail.com with ESMTPSA id t1sm2018686wrx.28.2021.06.09.22.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 22:20:09 -0700 (PDT)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210609100240.1285032-1-thuth@redhat.com>
 <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org>
 <YMCmNrcNByZ+Ozxn@redhat.com>
 <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
 <16fdaf9e-e3ed-9de5-932c-3db33c6f77ee@redhat.com>
 <20210609125051.l5qh3ub3sau47kow@sirius.home.kraxel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
Message-ID: <424a8fd7-b8ad-602e-8baf-b05981630112@redhat.com>
Date: Thu, 10 Jun 2021 07:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210609125051.l5qh3ub3sau47kow@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 libvir-list@redhat.com, smitterl@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2021 14.50, Gerd Hoffmann wrote:
>    Hi,
> 
>>> The #if CONFIG_SDL approach will not work because qemu will continue to
>>> report sdl as supported even when the sdl module is not installed any
>>> more.
>>
>> I guess we'd need a separate QMP command to fix that, which tries to load
>> the modules first when being called? Something similar to what is being done
>> in qemu_display_help() ?
> 
> That would work, yes.
> 
>> That's certainly doable, too, just a little bit more complex...
> 
> Alternative idea: turn QemuDisplay into an ObjectClass, then it'll be
> visible in qom introspection.  Likewise a bit more complex ...
> 
>> do we want that?  Or is the quick-n-easy way via the schema good
>> enough for most use cases?
> 
> Would be better than nothing, but I'd prefer something which works
> properly with modular qemu ...

I'm not sure whether we can even make it 100% rock solid if we introduce a 
dedicated QMP command here. For example imagine that libvirt did its probing 
while a X11 server was running, so it discovered that QEMU could be used 
with SDL. Now the user stops the X11 server, thus the cached information 
that QEMU could be used with SDL becomes useless. I think that's somehow 
similar to the situation whether the module is available or not. The 
information that is shown by "virsh domcapabilities" can only be an 
indication of what can be used in the best case (module available, X11 
server running etc), but it can never be a 100% guarantee that the UI 
interface can really really be used.
Thus I tend to continue with the simple way via the QAPI schema right now, 
unless someone really has an urgent need for a separate QMP command (at 
least for the BZ that I listed in my original mail, the simple way via the 
QAPI schema is enough).

  Thomas


