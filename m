Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9536490C66
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:22:12 +0100 (CET)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Uln-00057Z-Co
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:22:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9UkE-0004AQ-IW
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:20:34 -0500
Received: from [2607:f8b0:4864:20::42b] (port=36750
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9UkC-00085V-ME
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:20:34 -0500
Received: by mail-pf1-x42b.google.com with SMTP id m21so10614940pfd.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 08:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GVH57anki28yz1FzFpOWGEo8RqWsSFddQR0Y0CUAyN4=;
 b=mohk2ELIE8w0ujTYsbukT+IHPZY0WOj7/9P1MLHGfhJgbgPiBSTHOUNCQTpkXOJdd+
 KoqzE0ateJRgO6/eRxLIr72ZV0QNoaz7K4VzUXZH8tDFR9JojNpLf2phMX4J1+RlP7T6
 WTTqOALE+2KrXzerwIVcP1qJAVsYGv4gFCd7CRAXokHYy+wjQZVTwMrwtWTFqnV3cQzr
 cIpFnjeWQZMTp5stS1UQN3mg0UPofE7kTlAYslc1BVsz+T39naddgyj9ObGRCA83fVJy
 AR3tn85RW1PnmhvLwUrBtwCkxBtQ7PIPLdexrF5xIsvg4Q2ALWxbsi0D5iYUw480emX8
 cVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GVH57anki28yz1FzFpOWGEo8RqWsSFddQR0Y0CUAyN4=;
 b=6tc/hZ6wTAmQnF5ge494aS6IfG0XiHeOVHhAD6PuVcKqlC012caOHbtU6oT4/WIX2D
 ELgtSaFPjLMlL3O6e4bLaIQtlihgunyB7nxJlnQN6uigIUZui9Rn6FsYa+/kMKiEqVtR
 wnIRyWeAHQ9kR7cvYuE+GpGIonU1/1Tqn7NOxWgaLNXGqiX/NuqJ+b6gXNYU1C30CbGL
 ztoLXb2qmGDZaG6W/TLhGm+tuI/f9dNV0+Bn8r/9gM95nyph7zIiKhq0Nm22R1F5wo9k
 E5ZITsB/fm7Fvdrt7svJlgvPzY6jiM0/APo2A1t8z06v9GwCV6AIDBLXQn3iB+UQ1Rep
 l/Mw==
X-Gm-Message-State: AOAM530Cx4Sj202ar06msjwKON0AlN+RdMO64JpIQuUky0vCICTMctYd
 4E9HUucNLe41FS/h4z2czac=
X-Google-Smtp-Source: ABdhPJwh2GKTb/v9EEyIZfVwBnInSlLrsdcXKWt7leXD8+/2wTe3IxUa+1unJioHMEzGO1sQDGmkjw==
X-Received: by 2002:a05:6a00:168b:b0:4a8:d88:9cd with SMTP id
 k11-20020a056a00168b00b004a80d8809cdmr21380407pfc.11.1642436394384; 
 Mon, 17 Jan 2022 08:19:54 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i13sm12428297pgl.81.2022.01.17.08.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 08:19:54 -0800 (PST)
Message-ID: <bc26f3d1-12b2-7b50-4c46-5c4f934a6343@amsat.org>
Date: Mon, 17 Jan 2022 17:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
Content-Language: en-US
To: Liviu Ionescu <ilg@livius.net>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
 <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
 <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
 <3DE1FD39-B0F7-45D2-BC44-66D9B0533057@livius.net>
 <CAFEAcA8aMc40ea=F1P7vHHeNF=rqE+B=sz+6QdzrOWGwZU7W6A@mail.gmail.com>
 <E7A03D00-4F6F-4DC8-A8E5-84D0E13A79E3@livius.net>
In-Reply-To: <E7A03D00-4F6F-4DC8-A8E5-84D0E13A79E3@livius.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+Markus/Daniel/Marc-Andre

On 17/1/22 17:07, Liviu Ionescu wrote:
>> On 17 Jan 2022, at 16:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> This is newer versions of macOS being stricter about enforcing that
>> some operations are only permitted on the correct thread. Older versions
>> let QEMU/SDL get away with doing them on the "wrong" thread, which
>> all happened to work.
> 
> Ah, right, I remember this gave me a lot of headaches when I added the animated LEDs to qemu-system-gnuarmeclipse, and in the end I had to rewrite the SDL code to guarantee that graphical updates happen only on the main thread.
> 
>> It looks like it's "code would need to be updated to fix the
>> problems that newer macOS complains about", which nobody has done.
> 
> Later this year I plan to add animated LEDs to qemu-system-arm too, so I might face the same problems again.

Note, this topic has been discussed 2 years ago while I proposed an UI
visualizer:
https://wiki.qemu.org/Internships/ProjectIdeas/ArduinoVisualisation

The consensus was UI should not be addressed within QEMU itself, but
via an external helper, eventually using D-Bus. D-Bus support has been
recently merged:
https://www.qemu.org/docs/master/interop/dbus.html

> If you think useful, I can contribute the patches back to upstream.

All contributions are welcomed for review. Even if a contribution is
not merged right away, you can see the mailing list as an archive for
previous attemps, in case a contributor gets stuck or have to switch
to another project, someone else can restart / keep working on earlier
series.

