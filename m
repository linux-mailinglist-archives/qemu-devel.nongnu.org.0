Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C237441501D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:47:13 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Gy-0002Hh-KM
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6O8-0006MU-3G
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6O5-0007QK-CX
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632333028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=324sILhdYxvnznF1+1US9ZnfMNECSzr9WbsW6XTulSY=;
 b=E8n8ZbaW45XShjIhrUOs3CPPG5KGfBn/cqikXFx/c+QJOzSkZ5DeFKx98tfBhyGzil9Lbz
 MBpIw5rRRYw7I5H3q/gW6yb/tA5F3xey/sFYq+ov5+/AhULIRPIIvnavV84fDYB4ghNWMa
 yopUA6OjsQfqVBv2klDEIW6l7jH4xSE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-liDOWW2bNNaZyn-slVa-Ow-1; Wed, 22 Sep 2021 13:50:26 -0400
X-MC-Unique: liDOWW2bNNaZyn-slVa-Ow-1
Received: by mail-wr1-f70.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so2863758wrn.12
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=324sILhdYxvnznF1+1US9ZnfMNECSzr9WbsW6XTulSY=;
 b=bM1Z3+dD0ScBE3XfuCsaUbkgMrSrG0SlaZ/UuYviF6kqN97qLi1rORfL2xcrviknFx
 AJo4B6TKy1CfsxHYdyS4ftmtbfbj3FKaAx6q0M+N5jN+w4fdfwcbFV9IS42sfNkEsPaw
 kgYouRLyoSHyOqyjKp1sVOqFCSAinUX7ow0hxCv/TtZEdfygKoiMG++i/wrdp8LB7zK8
 VaEVzapORKuK4fWAPA+k40HC+GtLYtCwOKrgWjcIh8sPs6k6GDatBjlLjjtSrcopuUab
 SVq4fztWuCrZgN8s0ze+/AtWrN9kv1eFPNkCsWQJ4h3fANQ4VX4j4YIfLsxf11L7KkLm
 Y0mg==
X-Gm-Message-State: AOAM533UNf416iVs2L4TpIqlq70gnWFAbyj4ta+imQaeFkkvXpfBiZ5Q
 bq54WxSalveDj9qToOouobPeTugg4fQr11spFsWtQX8qLAOuqlEA0rjBPUpMNnto7O9iwNP7qzr
 SGVYKF68wDgM+2is=
X-Received: by 2002:adf:d084:: with SMTP id y4mr217239wrh.249.1632333025506;
 Wed, 22 Sep 2021 10:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkTAxtj4TUqlJA16lEOK2zxOqi0Lnhv+gZIrdsyM50ICcEZWWLl648/QwzUYzfSBk/7cFBmA==
X-Received: by 2002:adf:d084:: with SMTP id y4mr217213wrh.249.1632333025297;
 Wed, 22 Sep 2021 10:50:25 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g205sm2940929wmg.18.2021.09.22.10.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:50:24 -0700 (PDT)
Message-ID: <a4debda9-f00b-dc99-7e7c-37ea9b4d7b5c@redhat.com>
Date: Wed, 22 Sep 2021 19:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Damien,

On 9/22/21 18:13, Damien Hedde wrote:
> 
> The goal of this work is to bring dynamic machine creation to QEMU:
> we want to setup a machine without compiling a specific machine C
> code. It would ease supporting highly configurable platforms (for
> example resulting from an automated design flow). The requirements
> for such configuration include begin able to specify the number of
> cores, available peripherals, emmory mapping, IRQ mapping, etc.
> 
> This series focuses on the first step: populating a machine with
> devices during its creation. We propose patches to support this
> using QMP commands. This is a working set of patches and improves
> over the earlier rfc (posted in May):
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html

Do you have a roadmap for the following steps? Or are you done with
this series?

Yesterday I was thinking about this, and one thing I was wondering is
if it would be possible to have DeviceClass and MachineClass implement
a populate_fdt() handler, to automatically generate custom DTB for these
custom machines.

Maybe in your case you don't need that, as your framework generating the
QEMU machine also generates the DTB, or even parse a DTB to generate the
machine... :)

Regards,

Phil.


