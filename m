Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4331D536820
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:35:29 +0200 (CEST)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugg9-0007Jm-Ja
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nufa9-0003WX-OY
 for qemu-devel@nongnu.org; Fri, 27 May 2022 15:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nufa6-0006LY-TF
 for qemu-devel@nongnu.org; Fri, 27 May 2022 15:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653679504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6cDMpoN8oYdU88rrr9g4aWY+7Xpy5obqgUBvwpJgbg=;
 b=iDnWvJzWlVZMSzBmoIdYp4+ec8adye4oBZyb3xu5BMNWlHrjfEZvfbbkRmE5U2Dz8Ltl8u
 X8eXwKkgyhX+gZ1voLHqHFAzShHlDXLuYuLMD3XnKcQhiWpiwK60xYM3Hr/nJmZ+gipuq1
 XfDJJ9ixB7z0DMhJol1Z1HD7c6er0bM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-6x78uGWzNXSK8RNdQYHLWg-1; Fri, 27 May 2022 15:25:03 -0400
X-MC-Unique: 6x78uGWzNXSK8RNdQYHLWg-1
Received: by mail-yb1-f198.google.com with SMTP id
 e81-20020a253754000000b0065be96b9033so1049120yba.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 12:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6cDMpoN8oYdU88rrr9g4aWY+7Xpy5obqgUBvwpJgbg=;
 b=mjaw+GKeCf2X9y7fxoqYY/TtqMqvI4UOxdfsVcxS06w//jODMDYH2N8N3BXmnLCasr
 JgXGT112WaKxI+mGXRvDSA+yfWQhrKCiWkwA+2tCzVzhtRUbF+eVqdrr+Y+gVtjU0BrM
 LP3RaxGMOCpVCx4YHnRBzuzO1cSfT2sKr1FEah8Qruy+1LTjbp3eKqQIb+8mpZntXF6g
 rXGIkD3YqE8AWtBIQIjytGOuaLmpx9Yva7Kd/4+QGvweCAAE6dxb5SddXvox+P0VSHn/
 0nk+DpJ+5k75k0pL0vezrGe20E2spnJYM9Sq127qgIxzdU717R30eI+9+Hud/YcHrq5z
 wq5Q==
X-Gm-Message-State: AOAM533uOQQDp3WEnUvGrv6vJ+snDUnTCg+SwI4OYnsEspZi0sYPbxtz
 nrS/1egi7siW+kaeBo/NaqjUNT5XxGDyYPhZqfWCILPwRcMQx+RKOmd6nRo+HR1q56wcUS/WvJr
 CZbLJav0njJIWOUXPQLs9tit47FaA6Y8=
X-Received: by 2002:a81:a1d3:0:b0:30b:f7d1:21fa with SMTP id
 y202-20020a81a1d3000000b0030bf7d121famr1173980ywg.33.1653679502569; 
 Fri, 27 May 2022 12:25:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx36Yt8ZVNmhQ7cE6MUYT22HfQ1tfCV0rcTmIdKrW20EHYf/VqhiGAlxkj2g5/p2ELPqdxWFlrmZ7aTa67/G2A=
X-Received: by 2002:a81:a1d3:0:b0:30b:f7d1:21fa with SMTP id
 y202-20020a81a1d3000000b0030bf7d121famr1173966ywg.33.1653679502401; Fri, 27
 May 2022 12:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220527173058.226210-1-stefanb@linux.ibm.com>
In-Reply-To: <20220527173058.226210-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 27 May 2022 21:24:42 +0200
Message-ID: <CAMxuvax1PkLZb+Ms6n1wCyd8hHFsPQwi3xaM+RM0c1x7imQAzA@mail.gmail.com>
Subject: Re: [PATCH 0/2] backend/tpm: Resolve issue with TPM 2 DA lockout
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi

On Fri, May 27, 2022 at 7:36 PM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> This series of patches resolves an issue with a TPM 2's dictionary attack
> lockout logic being triggered upon well-timed VM resets. Normally, the OS
> TPM driver sends a TPM2_Shutdown to the TPM 2 upon reboot and before a VM
> is reset. However, the OS driver cannot do this when the user resets a VM.
> In this case QEMU must send the command because otherwise several well-
> timed VM resets will trigger the TPM 2's dictionary attack (DA) logic and
> it will then refuse to do certain key-related operations until the DA
> logic has timed out.

How does real hardware deal with that situation? Shouldn't this
"shutdown"/reset logic be implemented on swtpm side instead, when
CMD_INIT is received? (when the VM is restarted)

>
> Regards,
>   Stefan
>
> Stefan Berger (2):
>   backends/tpm: Record the last command sent to the TPM
>   backends/tpm: Send TPM2_Shutdown upon VM reset
>
>  backends/tpm/tpm_emulator.c | 44 +++++++++++++++++++++++++++++++++++++
>  backends/tpm/tpm_int.h      |  3 +++
>  backends/tpm/tpm_util.c     |  9 ++++++++
>  backends/tpm/trace-events   |  1 +
>  include/sysemu/tpm_util.h   |  3 +++
>  5 files changed, 60 insertions(+)
>
> --
> 2.35.3
>


