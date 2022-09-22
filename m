Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FA5E59A5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 05:34:54 +0200 (CEST)
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obCzF-0006Zk-9U
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 23:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obCug-0003Vk-7M
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 23:30:10 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:46904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obCue-00028J-DU
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 23:30:09 -0400
Received: by mail-qk1-x72d.google.com with SMTP id d17so5349680qko.13
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 20:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=6MSI5m82lFC9gmKE4o6cUZ/QH7Lf6bpPlJHEkGtu5QQ=;
 b=UY/IQ0Guh8dL4+ct16B1pK9z11EUYMfTtQ0oYAVggLWnKPwgul1KaEL/ISK9IayF+B
 rJTFV593lWu2JjNmIWRaw3kRUciPGNPlVSCwSNXoeIlv43jVT1JCLEe5BN/1juSBSFl9
 UbOs/cPS5qDhdL8hM/wyulIeTyMXeP4b5+WheSXaYBuz226p9FF4UFjGwItVhncc5xPL
 a2kbU27Z3xgXOM7TnqoOcmClKAlngIJlbpBcETnkcVSb/4LFXthoscKZqh68GAcBH++c
 hj7pcWfgwdZFxpmwxq+YBj5hxw/esiR7a0Qz/lbJRkfbeNQdvC+RaKPBg+Dvytteludb
 K0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6MSI5m82lFC9gmKE4o6cUZ/QH7Lf6bpPlJHEkGtu5QQ=;
 b=K6fJm2KISVRVu3z1LkFmnRQYlV9CG+fk8uSY4E4hKVl9Q9l2xJ2nfwhDa8lySyqNN0
 G3yjLgYXoB2/ze06M7jaWum6ra9G4mmp4s/X0JIwJQCETTKfu2dTCLU8axghZxgpwVhc
 7CmGPSoVXUusAUte1UoMys2QZAe1a/1K0kNcEp27a+iPsQv3sFIr6aVuQssIgd4nSXus
 7YDwFp30HuErDRuq66DUd80Trj1J9Dcm/Dg+TjNZUYolXsv7nICtV3biwDEXbj4P3MV7
 R9hJBxwAoBOYrZV9G5yPWm4OARsAwNMNxsLjFI97ABzRmnsfNNan5xx0iyoQJYZ4/seI
 CcxA==
X-Gm-Message-State: ACrzQf2yhMbx8uZKLq2Np7mOgrntrZK+R0hzdPeUla+1CmV2wF6XbBpY
 Ob2nWx+fSQTGrjdsayA9uZOaCqryR+NfLvkYkaA=
X-Google-Smtp-Source: AMsMyM6qwvDKKfVTdS/KYH87VkYN5jB4xRT+CMzYNdbsZZPLQNKZUd+Iy3tlpObjfZNBmv1RDaD1aQD9DW4iWnskk90=
X-Received: by 2002:ae9:dd42:0:b0:6cc:ead5:14b4 with SMTP id
 r63-20020ae9dd42000000b006ccead514b4mr853694qkf.94.1663817406267; Wed, 21 Sep
 2022 20:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-27-bmeng.cn@gmail.com>
 <CAJ+F1CLupcHMUSm2rfC5YPGX_JW0O+uG=UfQCdu5VCGRyma+CA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLupcHMUSm2rfC5YPGX_JW0O+uG=UfQCdu5VCGRyma+CA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Sep 2022 11:29:56 +0800
Message-ID: <CAEUhbmWH6sYPr8PGQmP7daZwYm3Jt_V0kanU+UcAEGO0NDNgJw@mail.gmail.com>
Subject: Re: [PATCH v2 26/39] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 5:54 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 20, 2022 at 3:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>>
>> Make sure QEMU process "to" exited before launching another target
>> for migration in the test_multifd_tcp_cancel case.
>>
>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
> fwiw, I didn't r-b the version with a busy wait
> (https://patchew.org/QEMU/20220824094029.1634519-1-bmeng.cn@gmail.com/202=
20824094029.1634519-42-bmeng.cn@gmail.com/)
>

My mistake. The R-B tag was added before I changed the implementation
and I forgot to remove the tag.

Regards,
Bin

