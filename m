Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24E6F07AB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 16:45:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps2rm-00071y-T8; Thu, 27 Apr 2023 10:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps2rk-00071A-8F
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:45:00 -0400
Received: from esa15.hc2706-39.iphmx.com ([216.71.140.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps2ri-00077e-Hs
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:44:59 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 272163429
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZyfvOqM5ICZ8793vrR0YlcFynXyQoLVcMsEvi/4bfWQNrUom1zYCm
 2QaC2iHP6mDYmT9Lo0kOdm/80NTuseBnNVlHQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim8c3l48sfrZ80sz5quq4lv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE2upOUW0MO4EjyO9nP1Ftz
 +NBD3MvV0XW7w626OrTpuhEg80iKIzyItpatC8xiz7eCvkiTNbIRKCiCd1whm9hwJATW6yHN
 oxHOFKDbzyZC/FLEl4TGJQyhs+imz/yfyAwRFe9//VtujaIkFYguFTrGNHMZOSPasxWokeZn
 1yZwmLlAE8CBtPKnFJp9Vrp3IcjhxjTQY8XCfi0++BnhHWVwWocDgBQUkG0ycRVkWa7UtNbb
 lUKo28g8/l0+0usQd3wGRa/pRZooyIhZjaZKMVigCnl90Yey1zx6rQsJtKZVOEbiQ==
IronPort-HdrOrdr: A9a23:dWjSdasiqxNH4kaWQiNyrAoq7skDRtV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoQZPwJE80l6QU3WBhB9aftWDd0QPDQb2Ki7GSoQEIcBeOldK1u5
 0QFZRWOZndCkV7kNa/wCTQKadY/DBfytHNuQ4J9QYLcT1X
X-Talos-CUID: 9a23:fMzpk27HtEhH00H6xdss7VE0R+wfdHHm/n7AHX+bM3kwb/63cArF
X-Talos-MUID: 9a23:y3ietAtFtM4+xZaqTc2njyh8DMJH6qeSCUE0r8o7vdWGazRCNGLI
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 10:44:54 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6164549243eso30404796d6.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682606693; x=1685198693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iGMl0KCNh4GjT2466CMXXoVR9ZGmZFeoOJD2uIMFNNw=;
 b=o0Trp2TQJ76mH9GjbsefeuqBcxxqw2CIjyGMWf2xAyj9i6Vct6oOFBwd02UH+0PR6w
 AjYpfyAlB0FaaaBMWFf9vcJKSCpFDD7H8X99WRlUiU2EQ3EbNmFC+L/fb6s2aEUDzOwQ
 HpFyYOcL+M3T2/WKZGCrDX+1hE0Zroizdj+rD5XkFDHls0+qREN58CFdk9DanRcSByTX
 /RjR5gc7EsfFKiS4pDuv3aGAoKXflpHVT3PerlnNxPBNje8yz1r9PL42JC4UOid7hAUJ
 EWSYbE10wO7jbvZwonpAOULq69OP112B61PW3AVC3E8ooTrgxvKpKZDe6FuVdjeOqNql
 JJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682606693; x=1685198693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGMl0KCNh4GjT2466CMXXoVR9ZGmZFeoOJD2uIMFNNw=;
 b=RnCkVCdieg3BweENZgaoW2S3BUmu5qIaaO6D8CWzsqh9J9ZXZVZEoPR96hxATA6ljP
 mnbDS5yTs0Q7v0xftf+3xievfHu54niOJdfh8mFY3jp5cTALzuFHDrgb64zzDUCOJLc0
 IXZAhuZ/ZMp5uiN8QyKXdVpA9kU3Lo1EbOCZFOcFOECC1AUkhKYKhYbdpMKC7aDmNeQ4
 AVubCzQgA3/HjvTjvv4VqsNKXk6nuxECi5LJLpS47508zO/O9FFHQk2Tf7K1zGjITlkt
 aWCXEldtI32bP5DJ8ARUqWbDEH2HY4UsB36UEMrPRm3+qUVBY3rv4JBK9+9gfnb59AO2
 6Jog==
X-Gm-Message-State: AC+VfDx/UZO8xI3Tb/4xLkTKw99bP4LNTw8FODWlIoNZhrf3B97fVwe2
 TJ4SagTwsUipObPAbZCOAjGv6/vWqmkcNJD976mtg3UNTUO1aFvY7pSAXSOADFwmuV393C8zCOS
 9HmNLiMJDh0zNDZQtTjp6L6nPvWNIM3JcDKU6Xih+iUU=
X-Received: by 2002:a05:6214:2b0d:b0:56e:a2cb:5732 with SMTP id
 jx13-20020a0562142b0d00b0056ea2cb5732mr2784061qvb.9.1682606693426; 
 Thu, 27 Apr 2023 07:44:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67FEJnF1wACZhweQEOsTgV9pWRY3Eoj5fdtPWs/rB8+vueGXjU4WsFnnb5sEmFror8ZG6Ngg==
X-Received: by 2002:a05:6214:2b0d:b0:56e:a2cb:5732 with SMTP id
 jx13-20020a0562142b0d00b0056ea2cb5732mr2784014qvb.9.1682606693176; 
 Thu, 27 Apr 2023 07:44:53 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x6-20020ac87306000000b003e4d9c91106sm6232025qto.57.2023.04.27.07.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 07:44:52 -0700 (PDT)
Date: Thu, 27 Apr 2023 10:44:48 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Fam Zheng <fam@euphon.net>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Subject: Re: [PATCH v9 7/8] memory: abort on re-entrancy in debug builds
Message-ID: <20230427144444.dnjazwxpcrmrce7e@mozz.bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
 <20230426161951.2948996-8-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426161951.2948996-8-alxndr@bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.200; envelope-from=alxndr@bu.edu;
 helo=esa15.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 230426 1219, Alexander Bulekov wrote:
> This is useful for using unit-tests/fuzzing to detect bugs introduced by
> the re-entrancy guard mechanism into devices that are intentionally
> re-entrant.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---

This doesn't actually do anything right now. Doesn't look like DEBUG is
defined with --enable-debug

Any suggestion for how to make re-entrancy louder/fatal on
debug/developer builds? Maybe we can just replace the trace event with
an unconditional log-message?

