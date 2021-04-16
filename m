Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3CC36250A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:05:36 +0200 (CEST)
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQyN-0007vX-FY
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQns-00081v-5k
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQnq-0002CY-2C
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618588481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gedH+JLCCxfQmTqrY+VPsftyan25pFDHZpVm2cKmcIs=;
 b=Ax1ROdlHYOxc+8vTVgFc6jt/9XSLNiVSnj2X1gflkrR9OpsHR9fzyT56YXm8HFrqeIrmIL
 8WuPMnrA6Vbl2KGvNmycmHfV/b8jPA5OZN9+8Ez0YQj4hKeQXmDCE52HyfP8NHvOV44w1r
 xF7oNaKZYRVugsypPWHsJdnl/MVv3Vs=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-gQ6XGMWSMaihz0cXfV7oSw-1; Fri, 16 Apr 2021 11:54:40 -0400
X-MC-Unique: gQ6XGMWSMaihz0cXfV7oSw-1
Received: by mail-vk1-f197.google.com with SMTP id
 g63-20020a1f52420000b02901d8c3254041so2707222vkb.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gedH+JLCCxfQmTqrY+VPsftyan25pFDHZpVm2cKmcIs=;
 b=eVVKO21tMzQLJRDAB0xIMO28cUgB7OBOvAaXGcuZwxTCv1TOE4r0F5/eVbjOBzEeiI
 PfZvlT0ceJbL/xY3vwlhU+mGz4M7o9vkDrEpIPFnk0YpnLmIYj6yum1FKehlEgCaZy/c
 VT8lCTp6S18ZvgRtJWvShddChw9k0RZmL3QpjZbpG50l9wR54ILzEfUZyBGFFGaYdkiC
 +lAegQn5sdNMG1Uy68UxTudAH1s0Y+X0Ld3Ttx6wuM8sW8e2rRoklRgfc8kKsnvT5CYt
 QK+of40MqXcsTMaVQuXhABe8lT14VicjeOeWebEXaOVUsDXhczHp5RSU+MBD8r9cRvHI
 J0hg==
X-Gm-Message-State: AOAM533DHsFZXpXWVGpYoM+53T0jjgTKJO22NyudKSVdj67x+iwtrMDT
 yhNMBspNcJLz6LTymaj8mbwcLkv57Ymx00tLOoqafbMqr6EkVEwVIcV4+ClceyXGORqLFXqKQcE
 AfRWFU6ve3BZudS7EZ9MDrTlXMQNkRgk=
X-Received: by 2002:ab0:3750:: with SMTP id i16mr7137178uat.113.1618588478697; 
 Fri, 16 Apr 2021 08:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZywy9kIANKEHGMuOp4AT/5XtFYfconX2k0hR+MBXm9CFzApdrT8yP7qXq2CY+fZpQT710Q19QO/en3kAZ3cc=
X-Received: by 2002:ab0:3750:: with SMTP id i16mr7137165uat.113.1618588478543; 
 Fri, 16 Apr 2021 08:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-6-crosa@redhat.com>
 <28f2fd45-4ccd-2c9c-29d6-2de5f52bbc4c@redhat.com>
In-Reply-To: <28f2fd45-4ccd-2c9c-29d6-2de5f52bbc4c@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 16 Apr 2021 12:54:12 -0300
Message-ID: <CAKJDGDbq3GF_wHAc8t=2ie6uohcZkaTOhrjjRwOnrV_np8-FmQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] tests/acceptance/cpu_queries.py: use the proper
 logging channels
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 2:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 4/15/21 11:51 PM, Cleber Rosa wrote:
> > The test contains methods for the proper log of test related
>
> "The Test class ..."?
>
> > information.  Let's use that and remove the print and the unused
> > logging import.
> >
> > Reference: https://avocado-framework.readthedocs.io/en/87.0/api/test/av=
ocado.html#avocado.Test.log
>
> This test predates Avocado 87.0 :) Maybe mention this is an update
> to the recent API?

This is not a new feature of Avocado 87.0, it has been there since
before Avocado was used on QEMU.


