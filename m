Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C776BB96A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 17:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcTnw-0001na-6x; Wed, 15 Mar 2023 12:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pcTnb-0001eW-P7
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pcTna-0002yR-3k
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678896977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4xtkGzZ53DAhFEm1LVk+GIAlcugDqq2chdvCoPx3N4=;
 b=WI3FgfHkTZwavhrt0hWW/yTby1bbS6olUjNp7QBnANf6T7Xiv/sG6VWB7RGviMq1munoWL
 Z9lW7SITdSZ3AiS9672/Aq7IH1mJBjh0v4IR7hpTAkFRAnR6eKogBiRFV8AV2rK1TK+n2h
 uh4juXK2aK2eokdkLGIRsPHdB1rHVJ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462--okqkFmCNb2ONNPwEyThEA-1; Wed, 15 Mar 2023 12:16:13 -0400
X-MC-Unique: -okqkFmCNb2ONNPwEyThEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C40AF29AA39A;
 Wed, 15 Mar 2023 16:16:12 +0000 (UTC)
Received: from [10.39.192.71] (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C945D2166B26;
 Wed, 15 Mar 2023 16:16:11 +0000 (UTC)
Message-ID: <703ac3d4-e14e-1df6-aaa1-a7456b7dd89c@redhat.com>
Date: Wed, 15 Mar 2023 17:16:10 +0100
MIME-Version: 1.0
Subject: Re: [PULL 0/3] Edk2 stable202302 20230309 patches
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230309115714.906369-1-kraxel@redhat.com>
 <CAFEAcA_KwKQjgsx+4C_3an6ujhN=ETYFbaOjgU7Bg4OYt10OgA@mail.gmail.com>
 <20230315155655.ww75ox7hougl32wk@sirius.home.kraxel.org>
Content-Language: en-US
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230315155655.ww75ox7hougl32wk@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/15/23 16:56, Gerd Hoffmann wrote:
>   Hi,
> 
>> ▶ 206/206 ERROR:../tests/qtest/acpi-utils.c:158:acpi_find_rsdp_address_uefi:
>> code should not be reached ERROR
>> 206/206 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test
>> ERROR 706.75s killed by signal 6 SIGABRT
> 
> mst?  laszlo?  Any hints how to debug that?
> 
> Tried to start qemu manually with the command line I get from
> "make V=1 check-qtest-aarch64", that seems to start the uefi
> app from the iso image just fine ...

This is strange, the search is supposed to continue for 600 seconds (see
TEST_DELAY and TEST_CYCLES). I've got no better idea than to run the
UEFI application, then dump the guest memory from the QEMU monitor, and
then fish around in it...

Laszlo


