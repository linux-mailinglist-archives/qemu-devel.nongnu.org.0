Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C13755BD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:35:07 +0200 (CEST)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lef5m-0000Mu-VV
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leeyD-0002Ix-Go
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leeyA-0003o4-VI
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620311233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Yv7slJuaggEkZWT8w9+hStrjFobFpZmAlIidCRXr9I=;
 b=AtuS/nCdJOz7n/Z0fuOdCsdfzy90HbSktgYvq4rcWZt8OHYuabiYDy2ZP+z0Bif4Mqjr1k
 frJgo9SFxgGKbSSk4QYZ7dTN82RmkhNgV/zJrwaJ6Ata6ENKpyc2oL61RhmGpYX+2RWBpM
 pjlTaJl2vX+czU9WADNw+UhE2cNO0CI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-sLZEpAkMOxm5Ni39oCh1yw-1; Thu, 06 May 2021 10:27:10 -0400
X-MC-Unique: sLZEpAkMOxm5Ni39oCh1yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j136-20020a1c238e0000b029014675462236so1047212wmj.7
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Yv7slJuaggEkZWT8w9+hStrjFobFpZmAlIidCRXr9I=;
 b=Pt9S3mSyMGJuKtyrWz6jyjZGo/vLZl3Bc57dqajubzuty7TBMp9d0X56VuiINcIgIy
 zIvixItNuaX7O9mnhqYRzUZ6XWEP18qHYm8byp5diBfFhsBXUsxEzAgEEboVGBIHFofx
 SR89A5nRHdM8rJ6JhkXTdxTmgLj6OF0079c50qsjlInWhD90cEPcFwRSp3gIdHKgWD6p
 lVEvlQcF2I04SnP2bkTHx1V/Ximi6HEtAO5vTZAN/pk4wKbCJlX7m6NZ0An48rxeQLf4
 z1/SjtZmpQk9v7ebNjRsyyDiGGZxmYQYShvbfaXIxdZuks04z2qiVZQED7Cjjk2qYokQ
 SPzg==
X-Gm-Message-State: AOAM533kBRZGvfRSCZyRoiNYlb3vdavI/NvhOPWI+o9n2GOcfOO3rbre
 m8GbmKdLpfOxOjvTa8/dLA7nFfNNcAe4Mxf/nE+79N5trGuOSs9HR/Dtw0TP+CzSDDv1yuEpYg9
 Z3ell2OXhEe+CZ9A=
X-Received: by 2002:a1c:9817:: with SMTP id a23mr4161881wme.171.1620311228844; 
 Thu, 06 May 2021 07:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1Ih5W6g0n6aVCnLyKJbQPkXe2R/B3HV0qAW+5Cedmi3Ucf7RTbuA7LyKPI/qophjqxEGZeA==
X-Received: by 2002:a1c:9817:: with SMTP id a23mr4161861wme.171.1620311228646; 
 Thu, 06 May 2021 07:27:08 -0700 (PDT)
Received: from thuth.remote.csb (pd9575b79.dip0.t-ipconnect.de.
 [217.87.91.121])
 by smtp.gmail.com with ESMTPSA id l22sm9629461wmq.28.2021.05.06.07.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 07:27:08 -0700 (PDT)
Subject: Re: [PATCH v21 09/20] multi-process: define MPQemuMsg format and
 transmission functions
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1611938319.git.jag.raman@oracle.com>
 <56ca8bcf95195b2b195b08f6b9565b6d7410bce5.1611938319.git.jag.raman@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7433948d-02bb-625f-b6b6-9421b1d7c05b@redhat.com>
Date: Thu, 6 May 2021 16:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <56ca8bcf95195b2b195b08f6b9565b6d7410bce5.1611938319.git.jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, quintela@redhat.com,
 mst@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, kwolf@redhat.com, berrange@redhat.com,
 mreitz@redhat.com, ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/2021 17.46, Jagannathan Raman wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> 
> Defines MPQemuMsg, which is the message that is sent to the remote
> process. This message is sent over QIOChannel and is used to
> command the remote process to perform various tasks.
> Define transmission functions used by proxy and by remote.
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
[...]
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> new file mode 100644
> index 0000000..b3d380e
> --- /dev/null
> +++ b/hw/remote/mpqemu-link.c
[...]
> +bool mpqemu_msg_valid(MPQemuMsg *msg)
> +{
> +    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
> +        return false;
> +    }

  Hi!

A bug in this code has been reported on Launchpad:

  https://bugs.launchpad.net/qemu/+bug/1926995

Could someone please send a patch for this issue?

  Thanks,
   Thomas


