Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE7B563403
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:06:36 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GLy-0000Wx-SB
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1o7GIC-0006rQ-Ie
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1o7GI6-0002RS-Qp
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656680553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WReoC88Oe6CgEBZB+mJ7eWH3no6TOUudufQSCMYDB4s=;
 b=fhaJkBYMBpzWATV7IZbOmdOZDTWts9KxuwmYgUKsMza9qGMXO2LHJ887MRr3gXEDXJmEAx
 6lBOwxPmi7wLLrEV6sEVZ1IIa39F8VJecjDOjp66A5gc+K3+k/4nPVpadpAkdX21orf9ET
 5eIXR9CkSPJ6sW4yJb7iIeng9U95EeM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-j_cecKgFOSqkbSNOZXuT9Q-1; Fri, 01 Jul 2022 09:01:23 -0400
X-MC-Unique: j_cecKgFOSqkbSNOZXuT9Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 w22-20020a05640234d600b00435ba41dbaaso1736969edc.12
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 06:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WReoC88Oe6CgEBZB+mJ7eWH3no6TOUudufQSCMYDB4s=;
 b=zXF6KGWLmZMezyOHlaFoOsUXHmmNhVM3Uen4I1pG12RDEzwScREYeJDmyzYBVuxWTX
 p+xBiDf9/D3WUCzX/Hzyos3y9E/4u8wSVvqyaiE+XnSDOexUX4ef0BuJGjp72ULBn/I8
 HJIxCfz5Nwjv0t2SHQERW8BQVpntlUXR7Z6ncelCcwTxAy01o6UT/M8ooYTqQen7CsZW
 f2w0ACfMHum1/w/HYn87xQE+6T0zij59RqIYbBpyoPA3/zmVYErzVFRV26xjLKklTU3Y
 kPQCg5YtmvKiY9pV5/hI0anA3EI2J+wfQNlN8K0jgeXpZjFSZ9BikTOdaRRl6DiQfSBf
 HnpQ==
X-Gm-Message-State: AJIora/KpBgiiFz88bDKPqcquggNCb+dNVbozjU1KM4ExzVAI5EDu1xs
 xdqzBYCjW58dNWaWnHqSQKkc7ogEfDgDrAoYeXodjOOsuUuNnnbzEQS+UaWPGj9fHkwxFE3Td3S
 9bSBud6PBx3OfCps=
X-Received: by 2002:a17:907:7e8b:b0:726:2c51:b06e with SMTP id
 qb11-20020a1709077e8b00b007262c51b06emr13970192ejc.129.1656680482215; 
 Fri, 01 Jul 2022 06:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vyHxHgLmsBxizOJ5TeTduW4fWKtXriqr+3ncjwrfbGYosznewQI1GtOfuuQLsBAjmGeT10Zw==
X-Received: by 2002:a17:907:7e8b:b0:726:2c51:b06e with SMTP id
 qb11-20020a1709077e8b00b007262c51b06emr13970163ejc.129.1656680481945; 
 Fri, 01 Jul 2022 06:01:21 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm15200658edb.56.2022.07.01.06.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 06:01:21 -0700 (PDT)
Message-ID: <9cd7eb31-cb62-c06d-edcf-04ed81d7c33b@redhat.com>
Date: Fri, 1 Jul 2022 15:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [libvirt PATCH v2] tools: add virt-qmp-proxy for proxying QMP
 clients to libvirt QEMU guests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 libvir-list@redhat.com
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <20220620171950.1416742-1-berrange@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220620171950.1416742-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
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

On 6/20/22 19:19, Daniel P. Berrangé wrote:
> Libvirt provides QMP passthrough APIs for the QEMU driver and these are
> exposed in virsh. It is not especially pleasant, however, using the raw
> QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
> exposes a human friendly interactive shell. It is not possible to use
> this with libvirt managed guest, however, since only one client can
> attach to he QMP socket at any point in time.
> 
> The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
> socket and listens for incoming client connections, speaking QMP on
> the connected socket. It will forward any QMP commands received onto
> the running libvirt QEMU guest, and forward any replies back to the
> QMP client.
> 
>   $ virsh start demo
>   $ virt-qmp-proxy demo demo.qmp &
>   $ qmp-shell demo.qmp
>   Welcome to the QMP low-level shell!
>   Connected to QEMU 6.2.0
> 
>   (QEMU) query-kvm
>   {
>       "return": {
>           "enabled": true,
>           "present": true
>       }
>   }
> 
> Note this tool of course has the same risks as the raw libvirt
> QMP passthrough. It is safe to run query commands to fetch information
> but commands which change the QEMU state risk disrupting libvirt's
> management of QEMU, potentially resulting in data loss/corruption in
> the worst case.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> Changed in v2:
> 
>  - Rewrote to not be such a gross hack, specifically
>       - Wired up usage of libvirt event loop for sock I/O
>       - Register with libvirt for QMP events
>       - Incrementally read from socket & try json parsing
>         until we get a full command, instead of assuming
>         a full command in one read
>       - Forwarding of passed FDs in both directions
>         (libvirt -> client untested, since AFAIK, no
>         QMP cmd returns FDs currently)
> 
> 
> Other thought....
> 
> This patch is against libvirt.git but has a dependancy on the
> libvirt-python.git APIs. If we put this in libvirt-client RPM
> then we get a new dep on python.
> 
> Perhaps better to have this live in libvirt-python.git/examples,
> though I would like it present as a standard tool ? Another
> option is to bundle with virt-install which is a python app
> commonly present on virt hosts ?

Or, we could have it in a separate RPM which would require
libvirt-client and libvirt-python.

> 
>  docs/manpages/meson.build        |   1 +
>  docs/manpages/virt-qmp-proxy.rst | 120 +++++++++++
>  tools/meson.build                |   5 +
>  tools/virt-qmp-proxy             | 360 +++++++++++++++++++++++++++++++
>  4 files changed, 486 insertions(+)
>  create mode 100644 docs/manpages/virt-qmp-proxy.rst
>  create mode 100755 tools/virt-qmp-proxy

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


